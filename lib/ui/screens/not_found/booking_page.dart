import 'package:flutter/material.dart';

import 'package:demo_structure/core/themes/text.dart';
import 'package:demo_structure/ui/widgets/my_app_bar.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key, required this.booking, required this.userId});

  final String booking;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Booking page'),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Booking: $booking', style: AppStyles.button),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('UserId: $userId', style: AppStyles.button),
            ),
          ],
        ),
      ),
    );
  }
}
