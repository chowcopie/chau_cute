import 'dart:async';

import 'package:demo_structure/data/enums/auth_status.dart';
import 'package:demo_structure/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import 'app_router.dart';

abstract class SlideTransitionRoute extends GoRouteData {
  const SlideTransitionRoute();

  @override
  Widget build(context, state);

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: build(context, state),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return FadeTransition(opacity: curvedAnimation, child: child);
      },
    );
  }
}

abstract class AuthenticationRoute extends SlideTransitionRoute {
  const AuthenticationRoute();

  @override
  FutureOr<String?> redirect(context, state) async {
    Logger().i('AuthenticationRoute redirect ${state.matchedLocation}');

    bool isLoggedIn = AuthRepository.instance.isLoggedIn;
    final isLoggingIn = state.matchedLocation == '/login';
    final isRoot = state.matchedLocation == '/';

    if (AuthRepository.instance.authStatus == AuthStatus.checking) {
      final status = await AuthRepository.instance.getAuthStatus();
      isLoggedIn = status == AuthStatus.authenticated;
    }

    // Nếu chưa đăng nhập → chuyển hướng về Login
    if (!isLoggedIn) return const LoginRoute().location;

    // Nếu đã đăng nhập rồi và đang ở trang Login → chuyển về Home
    if (isLoggingIn || isRoot) return const HomeRoute().location;

    return null;
  }
}
