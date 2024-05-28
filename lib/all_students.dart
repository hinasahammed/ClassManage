import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All,\nStudents',
              style: theme.textTheme.headlineLarge!.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(20),
            for (var i = 0; i <= 5; i++)
              Card(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ajay devgn',
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'DOB: 10-10-2024',
                            style: theme.textTheme.labelLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            'Gender: Male',
                            style: theme.textTheme.labelLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.colorScheme.secondaryContainer,
                          ),
                          child: const Icon(Icons.edit)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
