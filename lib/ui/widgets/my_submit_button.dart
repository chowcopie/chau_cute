import 'package:flutter/material.dart';

import 'package:demo_structure/core/themes/text.dart';

class MySubmitButton extends StatelessWidget {
  const MySubmitButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.disabledBackgroundColor,
    this.onPressed,
  });

  final String text;
  final Color backgroundColor;
  final Color? disabledBackgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
        disabledBackgroundColor: disabledBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(
        text,
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: AppStyles.button.copyWith(
          color: onPressed == null ? Colors.white.withValues(alpha: .5) : null,
        ),
      ),
    );
  }
}
