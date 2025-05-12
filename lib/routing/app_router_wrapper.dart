import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

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
