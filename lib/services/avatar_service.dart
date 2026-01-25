import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

/// 头像服务类，处理头像的选择和本地存储
class AvatarService {
  final ImagePicker _imagePicker = ImagePicker();

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

  /// 保存头像到本地存储
  Future<String> uploadAvatar(File imageFile, User user) async {
    try {
      debugPrint('开始保存头像到本地，用户ID: ${user.uid}');
      
      // 检查文件是否存在
      if (!await imageFile.exists()) {
        throw Exception('图片文件不存在: ${imageFile.path}');
      }
      debugPrint('图片文件存在，大小: ${await imageFile.length()} 字节');
      
      // 获取应用文档目录
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String avatarsDir = path.join(appDocDir.path, 'avatars');
      
      // 创建 avatars 目录（如果不存在）
      final Directory dir = Directory(avatarsDir);
      if (!await dir.exists()) {
        await dir.create(recursive: true);
        debugPrint('创建头像目录: $avatarsDir');
      }
      
      // 删除旧头像（如果存在）
      await _deleteOldAvatar(user.uid);
      
      // 生成新的文件名
      final String fileName = '${user.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String localPath = path.join(avatarsDir, fileName);
      
      // 复制文件到本地目录
      debugPrint('复制头像文件到: $localPath');
      final File savedFile = await imageFile.copy(localPath);
      debugPrint('头像保存成功: ${savedFile.path}');
      
      // 保存头像路径到 SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('avatar_path_${user.uid}', localPath);
      debugPrint('头像路径已保存到 SharedPreferences');
      
      return localPath;
    } catch (e, stackTrace) {
      debugPrint('保存头像失败: $e');
      debugPrint('错误堆栈: $stackTrace');
      throw Exception('保存头像失败: $e');
    }
  }
  
  /// 获取本地头像路径
  Future<String?> getLocalAvatarPath(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? path = prefs.getString('avatar_path_$userId');
      if (path != null) {
        final File file = File(path);
        if (await file.exists()) {
          return path;
        } else {
          // 文件不存在，清除记录
          await prefs.remove('avatar_path_$userId');
        }
      }
      return null;
    } catch (e) {
      debugPrint('获取本地头像路径失败: $e');
      return null;
    }
  }
  
  /// 删除旧头像
  Future<void> _deleteOldAvatar(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? oldPath = prefs.getString('avatar_path_$userId');
      
      if (oldPath != null) {
        final File oldFile = File(oldPath);
        if (await oldFile.exists()) {
          await oldFile.delete();
          debugPrint('已删除旧头像: $oldPath');
        }
        await prefs.remove('avatar_path_$userId');
      }
    } catch (e) {
      debugPrint('删除旧头像失败（已忽略）: $e');
    }
  }

}
