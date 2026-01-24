import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

/// 头像服务类，处理头像的选择和上传
class AvatarService {
  final ImagePicker _imagePicker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// 选择图片（从相册或拍照）
  Future<XFile?> pickImage({ImageSource source = ImageSource.gallery}) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      return image;
    } catch (e) {
      throw Exception('选择图片失败: $e');
    }
  }

  /// 上传头像到 Firebase Storage 并更新用户信息
  Future<String> uploadAvatar(File imageFile, User user) async {
    try {
      // 生成唯一的文件名
      final String fileName = 'avatars/${user.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      
      // 创建存储引用
      final Reference ref = _storage.ref().child(fileName);
      
      // 上传文件
      final UploadTask uploadTask = ref.putFile(
        imageFile,
        SettableMetadata(
          contentType: 'image/jpeg',
          cacheControl: 'public, max-age=31536000',
        ),
      );

      // 等待上传完成
      final TaskSnapshot snapshot = await uploadTask;
      
      // 获取下载 URL
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      
      // 更新用户的 photoURL
      await user.updatePhotoURL(downloadUrl);
      await user.reload();
      
      return downloadUrl;
    } catch (e) {
      throw Exception('上传头像失败: $e');
    }
  }

  /// 删除旧的头像（可选，用于清理存储空间）
  Future<void> deleteOldAvatar(String? photoURL) async {
    if (photoURL == null || photoURL.isEmpty) return;
    
    try {
      // 从 URL 中提取路径
      final Uri uri = Uri.parse(photoURL);
      final String path = uri.pathSegments.last;
      
      // 如果路径包含 'avatars/'，则尝试删除
      if (photoURL.contains('avatars/')) {
        final Reference ref = _storage.ref().child('avatars/$path');
        await ref.delete();
      }
    } catch (e) {
      // 忽略删除错误，因为可能文件不存在或已被删除
      debugPrint('删除旧头像失败: $e');
    }
  }
}
