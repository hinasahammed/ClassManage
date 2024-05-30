import 'package:class_manage/models/student_model.dart';
import 'package:class_manage/ui/login/login_view.dart';
import 'package:class_manage/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UploadRepository {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future uploadStudent(StudentModel student, BuildContext context) async {
    try {
      await firestore.collection('Students').doc().set(student.toMap()).then(
        (value) {
          Utils.showSnackbarToast(
              context, "Successfully Added", Icons.check_circle);
        },
      );
    } catch (e) {
      if (context.mounted) {
        Utils.showSnackbarToast(context, e.toString(), Icons.error);
      }
    }
  }

  Future<DateTime?> selectDob(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (selectedDate == null) {
      if (context.mounted) {
        Utils.showSnackbarToast(context, "Pick a date", Icons.error);
      }
    }
    return selectedDate;
  }

  Future logout(BuildContext context) async {
    await auth.signOut().then(
      (value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const LoginView()));
      },
    );
  }
}
