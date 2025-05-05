// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootRoute,
      $notFoundRoute,
    ];

RouteBase get $rootRoute => GoRouteData.$route(
      path: '/',
      factory: $RootRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'profile/:uid',
          factory: $ProfileRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'booking/:booking',
              factory: $BookingRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $RootRouteExtension on RootRoute {
  static RootRoute _fromState(GoRouterState state) => const RootRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => ProfileRoute(
        uid: state.pathParameters['uid']!,
      );

  String get location => GoRouteData.$location(
        '/profile/${Uri.encodeComponent(uid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BookingRouteExtension on BookingRoute {
  static BookingRoute _fromState(GoRouterState state) => BookingRoute(
        booking: state.pathParameters['booking']!,
        uid: state.pathParameters['uid']!,
      );

  String get location => GoRouteData.$location(
        '/profile/${Uri.encodeComponent(uid)}/booking/${Uri.encodeComponent(booking)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $notFoundRoute => GoRouteData.$route(
      path: '/notFound',
      factory: $NotFoundRouteExtension._fromState,
    );

extension $NotFoundRouteExtension on NotFoundRoute {
  static NotFoundRoute _fromState(GoRouterState state) => const NotFoundRoute();

  String get location => GoRouteData.$location(
        '/notFound',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
