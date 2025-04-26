import 'package:demo_structure/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:demo_structure/core/themes/text.dart';
import 'package:demo_structure/ui/widgets/my_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Profile page'),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => GoRouter.of(context).pop(),
              child: const Text('Home page', style: AppStyles.button),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => const NotFoundRoute().push(context),
              child: const Text('Not found page', style: AppStyles.button),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => BookingRoute(
                    uid: uid,
                    bookingId: 'hoangdinhphu',
                  ).push(context),
              child: const Text('Booking page', style: AppStyles.button),
            ),
          ],
        ),
      ),
    );
  }
}
