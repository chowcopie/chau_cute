import 'package:flutter/material.dart';

class MyKeyboardDismiss extends StatelessWidget {
  const MyKeyboardDismiss({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
