import 'package:flutter/material.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: SizedBox.fromSize(
        size: const Size(50, 50),
        child: const CircularProgressIndicator(
          strokeWidth: 5,
        ),
      ),
    );
  }
}
