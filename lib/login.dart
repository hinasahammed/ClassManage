import 'package:class_manage/custom_button.dart';
import 'package:class_manage/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                'Hey,\nWelcome\nBack',
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
                title: 'Email address',
              ),
              const Gap(10),
              CustomTextformfield(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                validator: (value) {
                  return null;
                },
                suffixIcon: const Icon(Icons.visibility_off),
                title: 'Password',
              ),
              const Gap(20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forget password?',
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: () {},
                  title: 'Login',
                ),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Don't have an account? Register",
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
