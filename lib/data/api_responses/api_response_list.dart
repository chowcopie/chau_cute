import 'dart:convert';

import 'package:demo_structure/data/api_responses/api_response.dart';

class ApiResponseList<T> extends ApiResponse<List<T>?> {
  const ApiResponseList({
    required super.data,
    super.message,
    super.messageEn,
    super.enc,
    super.iv,
  });

  factory ApiResponseList.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    List<dynamic>? data;

    if (json['data'] is List) {
      data = json['data'] as List<dynamic>;
    } else {
      data = jsonDecode(json['data']);
    }

    return ApiResponseList<T>(
      data: data?.map(fromJsonT).toList(),
      message: json['message'] as String?,
      messageEn: json['messageEn'] as String?,
      enc: json['enc'] as bool?,
      iv: json['iv'] as String?,
    );
  }
}
