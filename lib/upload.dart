import 'package:class_manage/custom_button.dart';
import 'package:class_manage/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add,\nStudents\nDetails',
                  style: theme.textTheme.headlineLarge!.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(20),
                CustomTextformfield(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    return null;
                  },
                  title: 'Name',
                ),
                const Gap(10),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text('Gender'),
                  ),
                  dropdownColor: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                  items: [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text(
                        'Male',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text(
                        'Female',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                const Gap(20),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 50,
                    child: CustomButton(
                      icon: Icon(
                        Icons.calendar_month,
                        color: theme.colorScheme.onPrimary,
                      ),
                      onPressed: () {},
                      title: 'Date of birth',
                    ),
                  ),
                ),
                const Gap(40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () {},
                    title: 'Upload',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
