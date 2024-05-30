import 'package:class_manage/bloc/upload/upload_bloc.dart';
import 'package:class_manage/bloc/upload/upload_event.dart';
import 'package:class_manage/bloc/upload/upload_state.dart';
import 'package:class_manage/res/components/custom_button.dart';
import 'package:class_manage/res/components/custom_textformfield.dart';
import 'package:class_manage/models/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  final nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<UploadBloc>().add(Logout(context: context));
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
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
                  'Add,\nStudents\nDetails',
                  style: theme.textTheme.headlineLarge!.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(20),
                CustomTextformfield(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter an username';
                    }
                    if (value.length < 3) {
                      return 'Username length is short';
                    }
                    return null;
                  },
                  title: 'Name',
                ),
                const Gap(10),
                BlocBuilder<UploadBloc, UploadState>(
                  builder: (context, state) {
                    return DropdownButtonFormField(
                      value: state.dropValue,
                      onChanged: (value) {
                        context
                            .read<UploadBloc>()
                            .add(GetStudentValue(dropValue: value ?? 'Male'));
                      },
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
                        )
                      ],
                    );
                  },
                ),
                const Gap(20),
                BlocBuilder<UploadBloc, UploadState>(
                  builder: (context, state) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 50,
                        child: CustomButton(
                          icon: Icon(
                            Icons.calendar_month,
                            color: theme.colorScheme.onPrimary,
                          ),
                          onPressed: () {
                            context
                                .read<UploadBloc>()
                                .add(GetBirhDate(context: context));
                          },
                          title: state.dob == DateTime(2000, 1, 1)
                              ? "Pick Date"
                              : DateFormat.yMMMd().format(state.dob),
                        ),
                      ),
                    );
                  },
                ),
                const Gap(40),
                BlocBuilder<UploadBloc, UploadState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomButton(
                        status: state.status,
                        onPressed: () {
                          final studentModel = StudentModel(
                            name: nameController.text,
                            gender: state.dropValue,
                            dob: DateFormat.yMMMd().format(state.dob),
                          );
                          if (_formKey.currentState!.validate()) {
                            context.read<UploadBloc>().add(
                                  UploadStudentData(
                                    model: studentModel,
                                    context: context,
                                  ),
                                );
                          }
                        },
                        title: 'Upload',
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
