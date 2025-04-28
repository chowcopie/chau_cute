import 'dart:convert';

import 'package:demo_structure/data/models/user_model.dart';

import 'api_response.dart';

typedef JsonMap = Map<String, dynamic>;

T? deserialize<T>(Object? responseBody, T Function(JsonMap) fromJson) {
  if (responseBody == null) return null;
  if (responseBody is JsonMap) return fromJson(responseBody);

  final JsonMap json = jsonDecode(responseBody.toString());
  return fromJson(json);
}

ApiResponse<UserModel?> deserializeApiResponseUserModel(JsonMap responseBody) {
  return ApiResponse.fromJson(responseBody, (json) {
    return deserialize<UserModel>(json, UserModel.fromJson);
  });
}
