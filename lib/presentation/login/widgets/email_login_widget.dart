import 'package:flutter/material.dart';
import 'package:flutter_starter/core/routes/routes.dart';
import 'package:flutter_starter/core/themes/palette.dart';
import 'package:flutter_starter/common/my_button.dart';
import 'package:flutter_starter/common/my_text_field.dart';

typedef OnLoginClicked = void Function(String email, String password);

class EmailLoginWidget extends StatelessWidget {
  final OnLoginClicked onLoginClicked;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  EmailLoginWidget({super.key, required this.onLoginClicked});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyTextField(
            labelText: "Email",
            onChanged: (data) {},
            controller: emailController,
            validator: (p0) {
              if (p0 == null) {
                return "Email cannot be empty";
              }
              if (p0.isEmpty) {
                return "Email cannot be empty";
              }
              if (!p0.contains("@")) {
                return "Invalid email";
              }
              return null;
            },
            borderColor: Colors.transparent,
            focusedBorderColor: Colors.transparent,
            margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            prefixIcon: const Icon(Icons.alternate_email_outlined),
          ),
          MyTextField(
            labelText: "Password",
            onChanged: (data) {},
            controller: passwordController,
            validator: (p0) {
              if (p0 == null) {
                return "Password cannot be empty";
              }
              if (p0.isEmpty) {
                return "Password cannot be empty";
              }
              if (p0.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
            borderColor: Colors.transparent,
            focusedBorderColor: Colors.transparent,
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            isPasswordField: true,
            prefixIcon: const Icon(Icons.lock_outline),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.forgetPass);
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Palette.primaryColor),
                    )),
              )
            ],
          ),
          MyButton(
            text: "Login",
            percentage: 100,
            onTap: () {
              if (formKey.currentState!.validate()) {
                onLoginClicked(emailController.text, passwordController.text);
              }
            },
            margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
