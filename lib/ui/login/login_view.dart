import 'package:class_manage/bloc/login/login_bloc.dart';
import 'package:class_manage/bloc/login/login_event.dart';
import 'package:class_manage/bloc/login/login_state.dart';
import 'package:class_manage/res/components/custom_button.dart';
import 'package:class_manage/res/components/custom_textformfield.dart';
import 'package:class_manage/ui/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter email address';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                          .hasMatch(emailController.value.text)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    title: 'Email address',
                  ),
                  const Gap(10),
                  CustomTextformfield(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a password';
                      }
                      if (value.length < 6) {
                        return 'Your password is too short!';
                      }
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'Uppercase must contain';
                      }
                      if (!value.contains(RegExp(r'[a-z]'))) {
                        return 'lowercase must contain';
                      }
                      if (!value.contains(RegExp(r'[0-9]'))) {
                        return 'digits must contain';
                      }
                      if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        return 'Special chareacter must contain';
                      }
                      return null;
                    },
                    title: 'Password',
                  ),
                  const Gap(20),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          status: state.status,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(
                                    UserLogin(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                            }
                          },
                          title: 'Login',
                        ),
                      );
                    },
                  ),
                  const Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const RegisterView()));
                        },
                        child: Text(
                          "Register",
                          style: theme.textTheme.labelLarge!.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
