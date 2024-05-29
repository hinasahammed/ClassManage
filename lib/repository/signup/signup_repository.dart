import 'package:class_manage/ui/login/login.dart';
import 'package:class_manage/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupRepository {
  final auth = FirebaseAuth.instance;

  Future createAccount(
    BuildContext context,
    String email,
    String userName,
    String password,
  ) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => Utils.showSnackbarToast(
                context,
                "Account created successfully",
                Icons.check,
              ))
          .then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => const LoginView())));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          if (context.mounted) {
            Utils.showSnackbarToast(
                context, 'email address is not valid', Icons.error);
          }

        case "user-disabled":
          if (context.mounted) {
            Utils.showSnackbarToast(context, 'user-disabled', Icons.error);
          }
        case "user-not-found":
          if (context.mounted) {
            Utils.showSnackbarToast(context, 'user not found', Icons.error);
          }
        case "wrong-password":
          if (context.mounted) {
            Utils.showSnackbarToast(context, 'Wrong password', Icons.error);
          }
        default:
          Utils.showSnackbarToast(
              context, 'An undefined Error happened.', Icons.error);
      }
    }
  }
}
