import 'package:demo_structure/data/enums/auth_status.dart';
import 'package:demo_structure/ui/screens/auth/login_page.dart';
import 'package:demo_structure/ui/screens/home/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:demo_structure/ui/widgets/my_loading.dart';

import 'bloc/auth_bloc.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        switch (state.status) {
          case AuthStatus.checking:
            return const MyLoading();
          case AuthStatus.authenticated:
            return const HomePage();
          case AuthStatus.unauthenticated:
            return const LoginPage();
        }
      },
    );
  }
}
