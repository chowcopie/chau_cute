import 'dart:async';

import 'package:demo_structure/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

/// Thông báo cho [AppRouter] gọi lại [redirect] thông qua [notifyListeners]
class AppRouterListenable extends ChangeNotifier {
  AppRouterListenable._() {
    // Gọi lại [redirect] mỗi khi trạng thái đăng nhập thay đổi
    _authState = AuthRepository.instance.authState.listen((value) {
      Logger().w('Approute listen auth state change $value');
      notifyListeners();
    });
  }

  static final AppRouterListenable instance = AppRouterListenable._();

  late final StreamSubscription _authState;

  @override
  void dispose() {
    _authState.cancel();
    super.dispose();
  }
}
