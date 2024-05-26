import 'package:class_manage/custom_button.dart';
import 'package:class_manage/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
                "Let's get\nstarted",
                style: theme.textTheme.headlineLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(20),
              CustomTextformfield(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return null;
                },
                title: 'Username',
              ),
              const Gap(10),
              CustomTextformfield(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return null;
                },
                title: 'Email address',
              ),
              const Gap(10),
              CustomTextformfield(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility_off),
                validator: (value) {
                  return null;
                },
                title: 'Password',
              ),
              const Gap(10),
              CustomTextformfield(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility_off),
                validator: (value) {
                  return null;
                },
                title: 'Confirm password',
              ),
              const Gap(40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: () {},
                  title: 'Register',
                ),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Already have an account? Login",
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
