import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_path.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.home,
      builder: (context, state) => const SizedBox(),
      routes: [],
    ),
    GoRoute(
      path: RoutePath.about,
      builder: (context, state) => const SizedBox(),
    ),
    GoRoute(
      path: RoutePath.detail,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return SizedBox();
      },
    ),
    ShellRoute(
      routes: [],
      builder: (context, state, child) {
        return Scaffold(body: child);
      },
    ),
  ],
);

final GoRouter dynamicRouter = GoRouter.routingConfig(
  routingConfig: ValueNotifier(RoutingConfig(routes: [])),
);
