import 'package:demo_structure/core/permissions/permission_actions.dart';

class Permissions {
  Permissions({required this.id, required this.name, required this.actions});

  final String id;
  final String name;

  // Xác định với quyền này sẽ có những action nào
  final List<PermissionActions> actions;

  /// Example:
  /// Permission(
  ///   id: booking,
  ///   name: Dat lich,
  ///   actions [PermissionActions(1), PermissionActions(2)],
  /// );
  /// 
  /// Còn cần nghiên cứu thêm
}
