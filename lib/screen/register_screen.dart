import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:little_lemon_flutter/controller/auth_controller.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';
import 'package:little_lemon_flutter/widget/Auth/auth_input.dart';
import 'package:little_lemon_flutter/widget/Auth/button.dart';
import 'package:little_lemon_flutter/widget/Auth/button_text.dart';
import 'package:little_lemon_flutter/widget/Auth/header_onbording.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _controller = AuthController();
  bool isPasswordHidden = true;
  bool isConfirmPassHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const HeaderOnboarding(image: 'assets/Logo.png'),
              const SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(right: 190),
                child: Text(
                  "Personal Information",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              AuthInput(
                label: "Fullname",
                hint: "Fullname",
                keyboardType: TextInputType.text,
                controller: _controller.fullnameController,
                error: _controller.errorFullName,
                focusedColor: AppColor.primary,
              ),
              const SizedBox(height: 12),
              AuthInput(
                label: "email address",
                hint: "email address",
                keyboardType: TextInputType.emailAddress,
                controller: _controller.emailController,
                error: _controller.errorEmail,
                focusedColor: AppColor.primary,
              ),
              const SizedBox(height: 12),
              AuthInput(
                label: "Password",
                hint: "Password",
                keyboardType: TextInputType.text,
                controller: _controller.passwordController,
                error: _controller.errorPassword,
                focusedColor: AppColor.primary,
                obscure: isPasswordHidden,
                suffixIcon: isPasswordHidden
                    ? Icons.visibility_off
                    : Icons.visibility,
                onSuffixPressed: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
              ),
              const SizedBox(height: 12),
              AuthInput(
                label: "Confirm Password",
                hint: "Confirm Password",
                obscure: isConfirmPassHidden,
                keyboardType: TextInputType.text,
                controller: _controller.confirmPasswordController,
                error: _controller.errorConfirmPassword,
                focusedColor: AppColor.primary,
              ),
              Button(
                textButton: "Register",
                onPressed: () async {
                  bool isSuccess = await _controller.handleRegister(context);
                 setState(() {
                    if(isSuccess){
                      context.go('/homescreen');
                    }
                 });
                },
              ),
              ButtonText(
                askingtext: "Already Have Account?",
                text: "Login",
                button: () {
                 context.go('/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
}
