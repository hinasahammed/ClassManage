import 'package:class_manage/bloc/register/register_bloc.dart';
import 'package:class_manage/bloc/register/register_event.dart';
import 'package:class_manage/bloc/register/register_state.dart';
import 'package:class_manage/res/components/custom_button.dart';
import 'package:class_manage/res/components/custom_textformfield.dart';
import 'package:class_manage/ui/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

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
              key: _formkey,
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
                    controller: usernameController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter an username';
                      }
                      if (value.length < 3) {
                        return 'Username length is short';
                      }
                      return null;
                    },
                    title: 'Username',
                  ),
                  const Gap(10),
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
                    keyboardType: TextInputType.emailAddress,
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
                  const Gap(10),
                  CustomTextformfield(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Confirm the password';
                      }
                      if (value != passwordController.value.text) {
                        return "Your password doesn't match";
                      }
                      return null;
                    },
                    title: 'Confirm password',
                  ),
                  const Gap(40),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          status: state.status,
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              context.read<RegisterBloc>().add(
                                    UserRegister(
                                      context: context,
                                      email: emailController.text,
                                      userName: usernameController.text,
                                      password: confirmPasswordController.text,
                                    ),
                                  );
                            }
                          },
                          title: 'Register',
                        ),
                      );
                    },
                  ),
                  const Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Already have an account?",
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const LoginView()));
                        },
                        child: Text(
                          "Login",
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
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
