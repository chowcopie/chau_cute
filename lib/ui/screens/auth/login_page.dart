import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:demo_structure/core/themes/text.dart';
import 'package:demo_structure/ui/screens/auth/bloc/auth_bloc.dart';
import 'package:demo_structure/ui/widgets/my_app_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Login page'),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(
                  context,
                ).add(const AuthLoginEvent(userName: '', passWord: ''));
              },
              child: const Text('Login', style: AppStyles.button),
            ),
          ],
        ),
      ),
    );
  }
}
