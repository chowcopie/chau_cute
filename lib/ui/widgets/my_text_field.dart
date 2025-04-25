import 'package:flutter/material.dart';

import 'my_text_field_style.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.sportTextFieldStyle = const MyTextFieldStyle(),
    this.defaultSuffixIcon,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.onChanged,
    this.onClear,
    this.onTap,
    this.validator,
    this.alwaysShowClear = false,
    this.enable = true,
  }) : assert(initialValue == null || controller == null);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;

  final MyTextFieldStyle sportTextFieldStyle;
  final Widget? defaultSuffixIcon;
  final Widget? prefixIcon;

  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final Function()? onClear;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final bool alwaysShowClear;
  final bool enable;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late TextEditingController _localController;
  ValueNotifier<bool> showClearButton = ValueNotifier(false);
  bool showError = false;
  late VoidCallback _listener;

  @override
  void initState() {
    super.initState();

    showError = (widget.sportTextFieldStyle.errorText?.isNotEmpty == true);
    if (widget.controller != null) {
      _localController = widget.controller!;
    } else {
      _localController = TextEditingController.fromValue(
        TextEditingValue(text: widget.initialValue ?? ''),
      );
    }

    showClearButton.value = _localController.text.isNotEmpty;

    _listener = () {
      if (mounted) {
        showClearButton.value = _localController.text.isNotEmpty;
      }
    };

    _localController.addListener(_listener);
  }

  @override
  void didUpdateWidget(covariant MyTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.sportTextFieldStyle.errorText?.isNotEmpty == true) {
      showError = true;
    }

    // Chau (19-11-2024): Hot fix need test
    if (widget.initialValue == null) return;
    if (widget.controller != null) return;
    if (widget.initialValue == oldWidget.initialValue) return;

    _localController.value = TextEditingValue(
      text: widget.initialValue!,
      selection: TextSelection.collapsed(offset: widget.initialValue!.length),
    );
  }

  @override
  void dispose() {
    showClearButton.dispose();
    _localController.removeListener(_listener);
    if (widget.controller == null) {
      _localController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enable,
      controller: _localController,
      focusNode: widget.focusNode,
      textInputAction: widget.sportTextFieldStyle.textInputAction,
      textCapitalization: widget.sportTextFieldStyle.textCapitalization,
      keyboardType: widget.sportTextFieldStyle.keyboardType,
      cursorColor: Colors.orange,
      maxLines: widget.sportTextFieldStyle.maxLines,
      maxLength: widget.sportTextFieldStyle.maxLength,
      style: widget.sportTextFieldStyle.style,
      inputFormatters: widget.sportTextFieldStyle.inputFormatters,
      textAlign: widget.sportTextFieldStyle.textAlign,
      textAlignVertical: widget.sportTextFieldStyle.textAlignVertical,
      readOnly: widget.sportTextFieldStyle.readOnly,
      expands: widget.sportTextFieldStyle.expands,
      onFieldSubmitted: widget.onFieldSubmitted,
      onTap: widget.onTap,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }

        if (showError) {
          setState(() {
            showError = false;
          });
        }
      },
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: widget.sportTextFieldStyle.fillColor,
        hintText: widget.sportTextFieldStyle.hintText,
        hintStyle: widget.sportTextFieldStyle.hintStyle,
        counterText: widget.sportTextFieldStyle.counterText,
        contentPadding: widget.sportTextFieldStyle.contentPadding,
        errorText: showError ? widget.sportTextFieldStyle.errorText : null,
        errorStyle: widget.sportTextFieldStyle.errorStyle,
        suffixIconConstraints: widget.sportTextFieldStyle.suffixIconConstraints,
        prefixIconConstraints: widget.sportTextFieldStyle.prefixIconConstraints,
        disabledBorder: OutlineInputBorder(
          borderSide: widget.sportTextFieldStyle.haveBorder
              ? BorderSide(color: widget.sportTextFieldStyle.borderColor)
              : BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: widget.sportTextFieldStyle.haveBorder
              ? BorderSide(color: widget.sportTextFieldStyle.borderColor)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(
            widget.sportTextFieldStyle.borderRadius,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: widget.sportTextFieldStyle.haveBorder
              ? BorderSide(color: widget.sportTextFieldStyle.borderColor)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(
            widget.sportTextFieldStyle.borderRadius,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(
            widget.sportTextFieldStyle.borderRadius,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(
            widget.sportTextFieldStyle.borderRadius,
          ),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.sportTextFieldStyle.readOnly
            ? widget.defaultSuffixIcon ?? const SizedBox.shrink()
            : ValueListenableBuilder(
                valueListenable: showClearButton,
                builder: (context, value, child) {
                  if (value == true || widget.alwaysShowClear) {
                    return IconButton(
                      onPressed: () {
                        _localController.text = '';
                        if (showError) {
                          setState(() {
                            showError = false;
                          });
                        }

                        if (widget.onClear != null) {
                          widget.onClear!();
                        }
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: widget.sportTextFieldStyle.iconColor,
                        size: 24,
                      ),
                    );
                  }

                  return widget.defaultSuffixIcon ?? const SizedBox.shrink();
                },
              ),
      ),
    );
  }
}
