import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Widget? icon;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
      ),
      icon: icon,
      onPressed: onPressed,
      label: Text(
        title,
        style: theme.textTheme.bodyLarge!.copyWith(
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
