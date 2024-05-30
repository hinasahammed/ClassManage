import 'package:class_manage/utils/status.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Widget? icon;
  final Status? status;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.icon,
    this.status,
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
      label: status == Status.loading
          ? CircularProgressIndicator(
              color: theme.colorScheme.onPrimary,
            )
          : Text(
              title,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
    );
  }
}
