import 'package:demo_structure/core/themes/color.dart';
import 'package:flutter/material.dart';

class BaseDialogForm extends StatelessWidget {
  const BaseDialogForm({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.surface,
        ),
        child: child,
      ),
    );
  }
}
