import 'package:flutter/material.dart';
import '../controller/asset_helper.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? displayError;
  String? displaySuccess;

  Future<void> handleLogin(BuildContext context) async {
    String email = emailController.text.trim();
    String pass = passwordController.text.trim();

    displayError = null;
    displaySuccess = null;

    if (email.isEmpty) {
      displayError = await AssetHelper.getMessage('error','email_empty');
    } else if (!email.contains('@')) {
      displayError = await AssetHelper.getMessage('error','email_invalid');
    } else if (pass.isEmpty) {
      displayError = await AssetHelper.getMessage('error','pass_empty');
    } else if (pass.length < 6) {
      displayError = await AssetHelper.getMessage('error','pass_short');
    }
    if (displayError != null) {
      AssetHelper.littleLemonToast(context, displayError!);
    } else {
      displaySuccess = await AssetHelper.getMessage('success','login_success');
      AssetHelper.littleLemonToast(context, displaySuccess!);
    }
  }
}
