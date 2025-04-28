import 'package:demo_structure/core/utils/converter.dart';

class UserModel {
  UserModel({required this.id, required this.name, required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: cvToString(json['id']),
      name: cvToString(json['name']),
      phone: cvToString(json['phone']),
    );
  }

  final String id;
  final String name;
  final String phone;
}
