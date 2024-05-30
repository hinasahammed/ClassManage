import 'package:class_manage/ui/login/login_view.dart';
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
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const LoginView()));
      }).then((value) {
        Utils.showSnackbarToast(
          context,
          "Account created successfully",
          Icons.check,
        );
      });
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
        case "email-already-in-use":
          if (context.mounted) {
            Utils.showSnackbarToast(
                context,
                'The email address is already in use by another account.',
                Icons.error);
          }
        default:
          Utils.showSnackbarToast(
              context, 'An undefined Error happened.', Icons.error);
      }
    }
  }
}
