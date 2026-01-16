import 'package:flutter/material.dart';
import '../controller/asset_helper.dart';

class AuthController {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? errorFullName;
  String? errorEmail;
  String? errorPassword;
  String? errorConfirmPassword;

  void ResetError() {
    errorFullName = null;
    errorEmail = null;
    errorPassword = null;
    errorConfirmPassword = null;
  }

  Future<bool> handleLogin(BuildContext context) async {
    ResetError();

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
    ResetError();

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
