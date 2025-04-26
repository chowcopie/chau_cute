import 'package:demo_structure/data/enums/auth_status.dart';
import 'package:demo_structure/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:demo_structure/ui/widgets/my_loading.dart';

import 'bloc/auth_bloc.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitializedState) {
          switch (state.status) {
            case AuthStatus.authenticated:
              const HomeRoute().go(context);
              return;
            case AuthStatus.unauthenticated:
              const LoginRoute().go(context);
              return;
          }
        }
      },
      builder: (context, state) {
        return const MyLoading();
      },
    );
  }
}
