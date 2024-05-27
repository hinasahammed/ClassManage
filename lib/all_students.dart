import 'package:flutter/material.dart';

class AllStudents extends StatelessWidget {
  const AllStudents({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          children: [
            Text(
              'All  ,\nStudents',
              style: theme.textTheme.headlineLarge!.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
