import 'package:demo_structure/core/themes/text.dart';
import 'package:demo_structure/routing/app_router.dart';
import 'package:demo_structure/ui/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Users page'),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => const ProfileRoute(uid: 'baochau').push(context),
              child: const Text('User: baochau', style: AppStyles.button),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => const ProfileRoute(uid: 'chill').push(context),
              child: const Text('User: chill', style: AppStyles.button),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => const ProfileRoute(uid: '12345').push(context),
              child: const Text('User: 12345', style: AppStyles.button),
            ),
          ],
        ),
      ),
    );
  }
}
