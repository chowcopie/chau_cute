import 'package:flutter/services.dart';

class MinValueInputFormatter extends TextInputFormatter {
  MinValueInputFormatter({required this.minValue});

  final int minValue;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Nếu chuỗi mới rỗng, cho phép vì TextField có thể xóa tạm thời
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Thử parse giá trị thành số
    final int? newValueInt = int.tryParse(newValue.text);
    if (newValueInt == null || newValueInt < minValue) {
      // Nếu giá trị mới nhỏ hơn minValue hoặc không phải số, giữ giá trị cũ
      return oldValue;
    }

    // Nếu giá trị hợp lệ, cho phép cập nhật
    return newValue;
  }
}
