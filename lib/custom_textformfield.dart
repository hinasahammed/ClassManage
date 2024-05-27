import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String title;
  final Widget? suffixIcon;
  const CustomTextformfield({
    super.key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    required this.title,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(title),
        suffixIcon: suffixIcon,
        focusColor: theme.colorScheme.primary,
      ),
    );
  }
}
