import 'package:class_manage/bottom_bar.dart';
import 'package:class_manage/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginRepository {

  final auth = FirebaseAuth.instance;

  Future login(String email, String password, BuildContext context) async {
    try {
      await auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => Utils.showSnackbarToast(
              context,
              'Login Successfully',
              Icons.check_circle,
            ),
          )
          .then((value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const BottomBar(),
                ),
              ));
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        if (context.mounted) {
          return Utils.showSnackbarToast(
              context, 'email address is not valid', Icons.error);
        }
      }
      if (error.code == 'user-disabled') {
        if (context.mounted) {
          return Utils.showSnackbarToast(
              context, 'email has been disabled', Icons.error);
        }
      }
      if (error.code == 'user-not-found') {
        if (context.mounted) {
          return Utils.showSnackbarToast(context,
              'there is no user corresponding to the given email', Icons.error);
        }
      }
      if (error.code == 'wrong-password') {
        if (context.mounted) {
          return Utils.showSnackbarToast(
              context, 'password is invalid', Icons.error);
        }
      }
      if (context.mounted) {
        return Utils.showSnackbarToast(
            context, error.message.toString(), Icons.error);
      }
    }
  }
}