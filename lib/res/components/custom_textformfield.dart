import 'package:class_manage/bloc/textField/textfield_bloc.dart';
import 'package:class_manage/bloc/textField/textfield_event.dart';
import 'package:class_manage/bloc/textField/textfield_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextformfield extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String title;
  const CustomTextformfield({
    super.key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<TextfieldBloc, TextfieldState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: !state.isVisible,
          validator: validator,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: theme.colorScheme.primary,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            label: Text(title),
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: () {
                      context.read<TextfieldBloc>().add(CheckVisibility());
                    },
                    icon: Icon(state.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                  )
                : const SizedBox(),
            focusColor: theme.colorScheme.primary,
          ),
        );
      },
    );
  }
}
