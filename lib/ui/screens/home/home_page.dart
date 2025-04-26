import 'package:demo_structure/core/themes/text.dart';
import 'package:demo_structure/routing/app_router.dart';
import 'package:demo_structure/ui/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Home page'),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:
                  () => const ProfileRoute(uid: 'vubaochau').push(context),
              child: const Text('Profile page', style: AppStyles.button),
            ),
          ],
        ),
      ),
    );
  }
}
