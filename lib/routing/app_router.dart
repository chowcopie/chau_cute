import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import 'package:demo_structure/data/enums/auth_status.dart';
import 'package:demo_structure/data/repositories/auth_repository.dart';
import 'package:demo_structure/routing/app_router_listenable.dart';
import 'package:demo_structure/routing/app_router_wrapper.dart';
import 'package:demo_structure/ui/screens/auth/login_page.dart';
import 'package:demo_structure/ui/screens/auth/splash_page.dart';
import 'package:demo_structure/ui/screens/home/home_page.dart';
import 'package:demo_structure/ui/screens/not_found/booking_page.dart';
import 'package:demo_structure/ui/screens/not_found/not_found_page.dart';
import 'package:demo_structure/ui/screens/profile/profile_page.dart';
import 'package:demo_structure/ui/screens/users/users_page.dart';

part 'app_router.g.dart';

/// Danh sách route không cần đăng nhập
const publicPaths = ['/notFound'];

final router = GoRouter(
  routes: $appRoutes,
  debugLogDiagnostics: true,
  initialLocation: '/',
  refreshListenable: AppRouterListenable.instance,
  errorBuilder: (context, state) => const NotFoundPage(),
  redirect: (BuildContext context, GoRouterState state) async {
    Logger().i('App router redirect ${state.matchedLocation}');

    // Nếu route là public thì không cần check
    if (publicPaths.contains(state.matchedLocation)) return null;

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
  },
);

@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  Widget build(context, state) => const SplashPage();
}

@TypedGoRoute<HomeRoute>(
  path: '/home',
  routes: [
    TypedGoRoute<UsersRoute>(path: 'users'),
    TypedGoRoute<ProfileRoute>(
      path: 'user/:uid',
      routes: [TypedGoRoute<BookingRoute>(path: 'booking/:booking')],
    ),
  ],
)
class HomeRoute extends SlideTransitionRoute {
  const HomeRoute();

  @override
  Widget build(context, state) => const HomePage();
}

class UsersRoute extends SlideTransitionRoute {
  const UsersRoute();

  @override
  Widget build(context, state) => const UsersPage();
}

class ProfileRoute extends SlideTransitionRoute {
  const ProfileRoute({required this.uid});

  final String uid;

  @override
  Widget build(context, state) => ProfilePage(uid: uid);
}

class BookingRoute extends SlideTransitionRoute {
  const BookingRoute({required this.booking, required this.uid});

  final String booking;
  final String uid;

  @override
  Widget build(context, state) => BookingPage(booking: booking, userId: uid);
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends SlideTransitionRoute {
  const LoginRoute();

  @override
  Widget build(context, state) => const LoginPage();
}

@TypedGoRoute<NotFoundRoute>(path: '/notFound')
class NotFoundRoute extends SlideTransitionRoute {
  const NotFoundRoute();

  @override
  Widget build(context, state) => const NotFoundPage();
}
