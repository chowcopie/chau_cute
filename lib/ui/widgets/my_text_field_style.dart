import 'package:demo_structure/core/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFieldStyle {
  const MyTextFieldStyle({
    this.hintText,
    this.errorText,
    this.counterText = '',
    this.style = const TextStyle(color: AppColors.inputText, fontSize: 16),
    this.hintStyle = const TextStyle(color: AppColors.intputHint),
    this.errorStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.inputFormatters,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.haveBorder = false,
    this.expands = false,
    this.readOnly = false,
    this.suffixIconConstraints = const BoxConstraints(
      minWidth: 48,
      minHeight: 48,
    ),
    this.prefixIconConstraints = const BoxConstraints(
      minWidth: 48,
      minHeight: 48,
    ),
    this.fillColor = AppColors.inputFill,
    this.iconColor = AppColors.inputIcon,
    this.borderColor = AppColors.inputBorder,
    this.borderRadius = 5,
  });

  // Text-related properties
  final String? hintText;
  final String? counterText;
  final String? errorText;

  final TextStyle style;
  final TextStyle hintStyle;
  final TextStyle? errorStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;

  final List<TextInputFormatter>? inputFormatters;

  // Visual properties
  final EdgeInsetsGeometry? contentPadding;
  final bool haveBorder;
  final bool expands;
  final bool readOnly;

  // Suffix icon properties
  final BoxConstraints suffixIconConstraints;
  final BoxConstraints prefixIconConstraints;

  // Color properties
  final Color fillColor;
  final Color iconColor;
  final Color borderColor;

  final double borderRadius;
}
