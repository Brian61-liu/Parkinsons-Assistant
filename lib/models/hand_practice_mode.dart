/// 手部练习模式（加深静态控制以外的引导练习，非医学评估）。
enum HandPracticeMode {
  /// 握机静止，传感器测晃动（原有行为）
  stillHold,

  /// 持物控制：示范 + 计时，用户自报完成（无物体检测）
  objectHold,

  /// 精细动作：对指循环，用户点按计数（无相机检测）
  fineMotor,
}
