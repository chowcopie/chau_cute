// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      data: fromJsonT(json['data']),
      message: json['message'] as String?,
      messageEn: json['messageEn'] as String?,
      enc: json['enc'] as bool?,
      iv: json['iv'] as String?,
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'message': instance.message,
      'messageEn': instance.messageEn,
      'enc': instance.enc,
      'iv': instance.iv,
    };
