import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  const ApiResponse({
    required this.data,
    this.message,
    this.messageEn,
    this.enc,
    this.iv,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  /// Dữ liệu trả về từ server
  final T data;

  /// Thông báo từ server
  final String? message;

  /// Thông báo từ server bằng tiếng anh
  final String? messageEn;

  /// Mã hóa dữ liệu
  /// Nếu là true có nghĩa là dữ liệu trả về được mã hóa
  /// Hiện tại cũng không cần thiết vì dữ liệu được giải trong Interceptor
  /// Vì đang làm theo task desc nên thêm vào thôi :v
  final bool? enc;

  /// Mã hóa iv
  /// Hiện tại cũng không cần thiết vì dữ liệu được giải trong Interceptor
  /// Vì đang làm theo task desc nên thêm vào thôi :v
  final String? iv;
}
