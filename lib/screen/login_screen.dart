import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/widget/Auth/auth_input.dart';
import 'package:little_lemon_flutter/widget/Auth/button.dart';
import 'package:little_lemon_flutter/widget/Auth/greeting.dart';
import 'package:little_lemon_flutter/widget/Auth/header_onbording.dart';
import '../controller/auth_controller.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';
import '../widget/Auth/button_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _controller = AuthController();
   bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderOnboarding(image: "assets/Logo.png"),
              const SizedBox(height: 20),
              const Greeting(greetingText: "Let's get to know you"),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                child: Text(
                  "Personal Information",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              AuthInput(
                label: "Email Address",
                hint: "Email Address",
                focusedColor: AppColor.primary,
                keyboardType: TextInputType.emailAddress,
                controller: _controller.emailController,
                error: _controller.errorEmail,
              ),
              const SizedBox(height: 12),
              AuthInput(
                label: "Password",
                hint: "Password",
                focusedColor: AppColor.primary,
                obscure: _isPasswordHidden,
                suffixIcon: _isPasswordHidden
                    ? Icons.visibility_off
                    : Icons.visibility,
                onSuffixPressed: () {
                  setState(() {
                    _isPasswordHidden = !_isPasswordHidden;
                  });
                },
                keyboardType: TextInputType.text,
                controller: _controller.passwordController,
                error: _controller.errorPassword,
              ),
              const SizedBox(height: 35),
              Button(
                textButton: "Login",
                onPressed: () => _controller.handleLogin(context),
              ),
              const SizedBox(height: 22),
              ButtonText(
                askingtext: "Don't have an account?",
                text: "Register",
                button: () {
                  print("Go to Register");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
