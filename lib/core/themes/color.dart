import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Không cho phép khởi tạo đối tượng

  // Màu chính dùng cho AppBar, Button, Icon nổi bật
  static const primary = Colors.blue;
  static const onPrimary = Colors.white;

  // Màu phụ hỗ trợ primary, dùng cho FAB, Chip, Tag
  static const secondary = Colors.amber;
  static const onSecondary = Colors.blue;

  // Màu nền cho toàn bộ màn hình
  static const background = Colors.white;
  static const onBackground = Colors.black;

  // Màu nền cho Card, BottomSheet, Dialog
  static const surface = Colors.white;
  static const onSurface = Colors.black;

  // Màu hiển thị trạng thái lỗi/thành công/cảnh báo
  static const error = Colors.red;
  static const warning = Colors.yellow;
  static const success = Colors.green;

  // Các màu phụ trợ
  static const disable = Colors.grey;
  static const divider = Colors.grey;

  // Các màu cho TextField, FormField
  static const inputFill = Colors.white;
  static const inputText = Colors.black87;
  static const intputHint = Colors.grey;
  static const inputIcon = Colors.black;
  static const inputBorder = Colors.grey;
  static const inputFocusBorder = Colors.blue;
  static const inputErrorBorder = Colors.red;
}
