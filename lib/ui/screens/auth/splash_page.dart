import 'package:demo_structure/data/enums/auth_status.dart';
import 'package:demo_structure/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:demo_structure/ui/widgets/my_loading.dart';

import 'bloc/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          const HomeRoute().go(context);
        }

        if (state.status == AuthStatus.unauthenticated) {
          const LoginRoute().go(context);
        }
      },
      child: const MyLoading(),
    );
  }
}
