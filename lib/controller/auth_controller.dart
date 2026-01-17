import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../controller/asset_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? errorFullName;
  String? errorEmail;
  String? errorPassword;
  String? errorConfirmPassword;

  void resetError() {
    errorFullName = null;
    errorEmail = null;
    errorPassword = null;
    errorConfirmPassword = null;
  }

  Future<bool> handleLogin(BuildContext context) async {
    resetError();

    String email = emailController.text.trim();
    String pass = passwordController.text.trim();

    bool isValid = true;

    if (email.isEmpty) {
      errorEmail = await AssetHelper.getMessage('error', 'email_empty');
      isValid = false;
    } else if (!email.contains('@')) {
      errorEmail = await AssetHelper.getMessage('error', 'email_invalid');
      isValid = false;
    }
    if (pass.isEmpty) {
      errorPassword = await AssetHelper.getMessage('error', 'pass_empty');
      isValid = false;
    } else if (pass.length < 6) {
      errorPassword = await AssetHelper.getMessage('error', 'pass_short');
      isValid = false;
    }
    if (isValid) {
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
      } on FirebaseAuthException catch (e) {
        String errorKey;
        if (e.code == 'user-not-found' ||
            e.code == 'wrong-password' ||
            e.code == 'invalid-credential') {
          errorKey = await AssetHelper.getMessage('error', 'login_fail');

          AssetHelper.littleLemonToast(context, errorKey);
          return false;
        }
      } catch (e) {
        AssetHelper.littleLemonToast(context, 'system_error');
        return false;
      }

      String successMessage = await AssetHelper.getMessage(
        'success',
        'login_success',
      );
      AssetHelper.littleLemonToast(context, successMessage);
      return true;
    }
    return false;
  }

  Future<bool> handleRegister(BuildContext context) async {
    resetError();

    String fullname = fullnameController.text.trim();
    String email = emailController.text.trim();
    String pass = passwordController.text.trim();
    String confirmpass = confirmPasswordController.text.trim();

    bool isValid = true;

    if (fullname.isEmpty) {
      errorFullName = await AssetHelper.getMessage('error', 'name_empty');
      isValid = false;
    } else if (fullname.length < 3) {
      errorFullName = await AssetHelper.getMessage('error', 'name_minimum');
      isValid = false;
    }
    if (email.isEmpty) {
      errorEmail = await AssetHelper.getMessage('error', 'email_empty');
      isValid = false;
    } else if (!email.contains('@')) {
      errorEmail = await AssetHelper.getMessage('error', 'email_invalid');
      isValid = false;
    }
    if (pass.isEmpty) {
      errorPassword = await AssetHelper.getMessage('error', 'pass_empty');
      isValid = false;
    } else if (pass.length < 6) {
      errorPassword = await AssetHelper.getMessage('error', 'pass_short');
      isValid = false;
    }
    if (confirmpass.isEmpty) {
      errorConfirmPassword = await AssetHelper.getMessage(
        'error',
        'confirm_empty',
      );
      isValid = false;
    } else if (pass != confirmpass) {
      errorConfirmPassword = await AssetHelper.getMessage('error', 'not_match');
    } else {
      errorConfirmPassword = null;
    }
    if (isValid) {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: pass);
        await FirebaseFirestore.instance
            .collection('user')
            .doc(userCredential.user!.uid)
            .set({
              'fullname': fullname,
              'email': email,
              'role': 'customer',
              'created_at': FieldValue.serverTimestamp(),
            });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          errorEmail = await AssetHelper.getMessage('error', 'email_used');
        } else {
          AssetHelper.littleLemonToast(
            context,
            await AssetHelper.getMessage('error', 'register_fail'),
          );
        }
        return false;
      } catch (e) {
        AssetHelper.littleLemonToast(context, 'Something wrong');
        return false;
      }
      String successMessage = await AssetHelper.getMessage(
        'success',
        'register_success',
      );
      AssetHelper.littleLemonToast(context, successMessage);
      return true;
    }
    return false;
  }

  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
