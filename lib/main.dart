// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';

import 'package:demo_structure/core/themes/theme.dart';
import 'package:demo_structure/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'package:demo_structure/routing/app_router.dart';
import 'package:demo_structure/ui/screens/auth/bloc/auth_bloc.dart';

void main() {
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  
  AuthRepository.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(const AuthInitialEvent()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.trackpad,
            PointerDeviceKind.unknown,
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
