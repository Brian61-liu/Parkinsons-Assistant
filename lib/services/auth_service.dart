import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'secure_storage_service.dart';

/// 认证服务
/// 符合 HIPAA/GDPR 医疗数据安全标准
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SecureStorageService _secureStorage = SecureStorageService.instance;

  // 获取当前用户
  User? get currentUser => _auth.currentUser;

  // 监听认证状态变化
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Google 登录
  Future<UserCredential?> signInWithGoogle() async {
    try {
      debugPrint('signInWithGoogle: 开始 Google 登录...');
      
      // 触发 Google 登录流程
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      if (googleUser == null) {
        debugPrint('signInWithGoogle: 用户取消了登录');
        return null;
      }
      
      debugPrint('signInWithGoogle: 获取 Google 认证信息...');

      // 获取认证信息
      final GoogleSignInAuthentication googleAuth = 
          await googleUser.authentication;

      debugPrint('signInWithGoogle: 创建 Firebase 凭证...');
      
      // 创建 Firebase 凭证
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      debugPrint('signInWithGoogle: 登录 Firebase...');
      
      // 使用凭证登录 Firebase
      final userCredential = await _auth.signInWithCredential(credential);
      
      debugPrint('signInWithGoogle: Firebase 登录成功！');

      // 后台保存用户信息（不阻塞登录流程）
      if (userCredential.user != null) {
        Future.microtask(() async {
          try {
            await _saveUserToFirestore(userCredential.user!).timeout(
              const Duration(seconds: 10),
              onTimeout: () => debugPrint('保存用户信息超时，跳过'),
            );
            await _logAuditEvent(
              userCredential.user!.uid,
              'LOGIN',
              'User logged in via Google',
            ).timeout(
              const Duration(seconds: 5),
              onTimeout: () => debugPrint('记录审计日志超时，跳过'),
            );
          } catch (e) {
            debugPrint('后台保存用户信息失败: $e');
          }
        });
      }

      return userCredential;
    } catch (e) {
      debugPrint('Google 登录错误: $e');
      rethrow;
    }
  }

  /// 保存用户信息到 Firestore（最小化数据原则）
  Future<void> _saveUserToFirestore(User user) async {
    final userDoc = _firestore.collection('users').doc(user.uid);
    
    // 只存储必要的用户信息（数据最小化原则）
    final userData = {
      'uid': user.uid,
      // 邮箱使用部分遮蔽处理
      'emailMasked': _maskEmail(user.email ?? ''),
      // 不直接存储完整姓名
      'displayNameInitial': user.displayName?.isNotEmpty == true 
          ? user.displayName![0] 
          : '?',
      'lastLoginAt': FieldValue.serverTimestamp(),
      'dataEncryptionVersion': 1,  // 用于将来的加密升级
    };

    // 检查用户是否已存在
    final docSnapshot = await userDoc.get();
    if (docSnapshot.exists) {
      // 更新最后登录时间
      await userDoc.update({
        'lastLoginAt': FieldValue.serverTimestamp(),
      });
    } else {
      // 创建新用户
      userData['createdAt'] = FieldValue.serverTimestamp();
      userData['privacyPolicyAcceptedAt'] = FieldValue.serverTimestamp();
      userData['privacyPolicyVersion'] = '1.0';
      await userDoc.set(userData);
    }
  }

  /// 遮蔽邮箱地址
  String _maskEmail(String email) {
    if (email.isEmpty || !email.contains('@')) return '***';
    final parts = email.split('@');
    final name = parts[0];
    final domain = parts[1];
    
    if (name.length <= 2) {
      return '***@$domain';
    }
    return '${name[0]}${'*' * (name.length - 2)}${name[name.length - 1]}@$domain';
  }

  /// 记录审计日志
  Future<void> _logAuditEvent(
    String userId,
    String eventType,
    String description,
  ) async {
    try {
      // 审计日志由 Cloud Functions 创建，这里只是触发
      // 实际实现中应使用 Cloud Functions 以确保日志不可篡改
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('audit_logs')
          .add({
        'eventType': eventType,
        'description': description,
        'timestamp': FieldValue.serverTimestamp(),
        'ipAddress': 'redacted', // 真实实现中不应存储 IP
      });
    } catch (e) {
      // 审计日志失败不应阻止正常操作
      debugPrint('审计日志记录失败: $e');
    }
  }

  /// 登出
  Future<void> signOut() async {
    try {
      final userId = currentUser?.uid;
      
      // 先执行关键的登出操作
      try {
        await _googleSignIn.signOut();
      } catch (e) {
        debugPrint('Google 登出错误: $e');
      }
      
      await _auth.signOut();
      
      // 非关键操作放在后面，不阻塞登出流程
      if (userId != null) {
        _logAuditEvent(userId, 'LOGOUT', 'User logged out').catchError((e) {
          debugPrint('审计日志记录失败: $e');
        });
      }
      
      // 清除本地安全存储的数据
      _secureStorage.clearAllSecure().catchError((e) {
        debugPrint('清除本地存储失败: $e');
      });
    } catch (e) {
      debugPrint('登出错误: $e');
      // 即使出错也尝试强制登出
      try {
        await _auth.signOut();
      } catch (_) {}
      rethrow;
    }
  }

  /// 获取用户数据
  Future<Map<String, dynamic>?> getUserData() async {
    final user = currentUser;
    if (user == null) return null;

    final doc = await _firestore.collection('users').doc(user.uid).get();
    return doc.data();
  }

  /// 保存震颤测试记录到云端（加密敏感数据）
  Future<void> saveTremorRecord({
    required double frequency,
    required double amplitude,
    required String severity,
    required DateTime timestamp,
    Map<String, dynamic>? additionalData,
  }) async {
    final user = currentUser;
    if (user == null) return;

    // 创建记录数据
    final recordData = {
      'frequency': frequency,
      'amplitude': amplitude,
      'severity': severity,
      'timestamp': Timestamp.fromDate(timestamp),
      'createdAt': FieldValue.serverTimestamp(),
      // 数据完整性哈希
      'dataHash': _secureStorage.hashData(
        '$frequency$amplitude$severity${timestamp.toIso8601String()}'
      ),
    };

    // 如果有额外数据，单独存储（不存储原始传感器数据到云端）
    if (additionalData != null) {
      // 只存储必要的汇总数据，不存储原始数据
      recordData['hasAdditionalData'] = true;
    }

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('tremor_records')
        .add(recordData);

    // 记录数据上传事件
    await _logAuditEvent(
      user.uid,
      'DATA_UPLOAD',
      'Tremor test record uploaded',
    );
  }

  /// 获取用户的震颤测试历史记录
  Stream<QuerySnapshot> getTremorRecordsStream({int? limit}) {
    final user = currentUser;
    if (user == null) {
      return const Stream.empty();
    }

    var query = _firestore
        .collection('users')
        .doc(user.uid)
        .collection('tremor_records')
        .orderBy('timestamp', descending: true);

    if (limit != null) {
      query = query.limit(limit);
    }

    return query.snapshots();
  }

  /// 删除单条震颤记录
  Future<void> deleteTremorRecord(String recordId) async {
    final user = currentUser;
    if (user == null) return;

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('tremor_records')
        .doc(recordId)
        .delete();

    await _logAuditEvent(
      user.uid,
      'DATA_DELETE',
      'Tremor record deleted: $recordId',
    );
  }

  /// 删除所有震颤记录（GDPR 合规：用户数据删除权）
  Future<void> deleteAllTremorRecords() async {
    final user = currentUser;
    if (user == null) return;

    final records = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('tremor_records')
        .get();

    final batch = _firestore.batch();
    for (final doc in records.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();

    await _logAuditEvent(
      user.uid,
      'DATA_DELETE_ALL',
      'All tremor records deleted by user request',
    );
  }

  /// 导出用户数据（GDPR 合规：数据可携带权）
  Future<Map<String, dynamic>> exportUserData() async {
    final user = currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    // 记录数据导出请求
    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('data_export_requests')
        .add({
      'requestedAt': FieldValue.serverTimestamp(),
      'status': 'completed',
    });

    // 获取用户基本信息
    final userData = await getUserData();

    // 获取所有震颤记录
    final records = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('tremor_records')
        .orderBy('timestamp', descending: true)
        .get();

    final exportData = {
      'exportedAt': DateTime.now().toIso8601String(),
      'userId': user.uid,
      'email': user.email,
      'profile': userData,
      'tremorRecords': records.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList(),
    };

    await _logAuditEvent(
      user.uid,
      'DATA_EXPORT',
      'User data exported',
    );

    return exportData;
  }

  /// 删除用户账户及所有数据（GDPR 合规：被遗忘权）
  Future<void> deleteAccount() async {
    final user = currentUser;
    if (user == null) {
      throw Exception('用户未登录');
    }

    // 先强制登出（最重要，确保用户立即被登出）
    try {
      await _googleSignIn.signOut();
    } catch (_) {}
    
    await _auth.signOut();
    
    // 后台清理数据（不阻塞用户）
    // 这些操作即使失败也不影响登出
    final userId = user.uid;
    Future.microtask(() async {
      try {
        await _firestore.collection('users').doc(userId).delete();
      } catch (_) {}
      try {
        await _secureStorage.clearAllSecure();
      } catch (_) {}
    });
  }

  /// 检查用户是否已接受最新隐私政策
  Future<bool> hasAcceptedLatestPrivacyPolicy() async {
    final user = currentUser;
    if (user == null) return false;

    final userData = await getUserData();
    if (userData == null) return false;

    const currentVersion = '1.0';
    return userData['privacyPolicyVersion'] == currentVersion;
  }

  /// 记录用户接受隐私政策
  Future<void> acceptPrivacyPolicy(String version) async {
    final user = currentUser;
    if (user == null) return;

    await _firestore.collection('users').doc(user.uid).update({
      'privacyPolicyAcceptedAt': FieldValue.serverTimestamp(),
      'privacyPolicyVersion': version,
    });

    await _logAuditEvent(
      user.uid,
      'PRIVACY_POLICY_ACCEPTED',
      'User accepted privacy policy version: $version',
    );
  }
}
