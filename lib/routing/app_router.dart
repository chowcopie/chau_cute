import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:demo_structure/ui/screens/auth/login_page.dart';
import 'package:demo_structure/ui/screens/auth/root_page.dart';
import 'package:demo_structure/ui/screens/home/home_page.dart';
import 'package:demo_structure/ui/screens/not_found/booking_page.dart';
import 'package:demo_structure/ui/screens/not_found/not_found_page.dart';
import 'package:demo_structure/ui/screens/profile/profile_page.dart';

part 'app_router.g.dart';

final router = GoRouter(
  routes: $appRoutes,
  debugLogDiagnostics: true,
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundPage(),
);

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

@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  Widget build(context, state) => const RootPage();
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends SlideTransitionRoute {
  const LoginRoute();

  @override
  Widget build(context, state) => const LoginPage();
}

@TypedGoRoute<HomeRoute>(
  path: '/home',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<ProfileRoute>(
      path: 'profile/:uid',
      routes: [TypedGoRoute<BookingRoute>(path: 'booking/:bookingId')],
    ),
  ],
)
class HomeRoute extends SlideTransitionRoute {
  const HomeRoute();

  @override
  Widget build(context, state) => const HomePage();
}

class ProfileRoute extends SlideTransitionRoute {
  const ProfileRoute({required this.uid});

  final String uid;

  @override
  Widget build(context, state) => ProfilePage(uid: uid);
}

class BookingRoute extends SlideTransitionRoute {
  const BookingRoute({required this.bookingId, required this.uid});

  final String bookingId;
  final String uid;

  @override
  Widget build(context, state) =>
      BookingPage(bookingId: bookingId, userId: uid);
}

@TypedGoRoute<NotFoundRoute>(path: '/notFound')
class NotFoundRoute extends SlideTransitionRoute {
  const NotFoundRoute();

  @override
  Widget build(context, state) => const NotFoundPage();
}
