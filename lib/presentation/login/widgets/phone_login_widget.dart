import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/common/my_button.dart';
import 'package:flutter_starter/presentation/common/my_text_field.dart';

class PhoneLoginWidget extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  const PhoneLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          MyTextField(
            labelText: "Phone No",
            controller: phoneController,
            onChanged: (p0) {},
            validator: (data) {
              if (data == null || data.isEmpty) {
                return "Phone no cannot be empty";
              }
              if (data.length < 10) {
                return "Phone no must be at least 10 characters";
              }
              return null;
            },
            maxLength: 10,
            keyboardType: TextInputType.name,
            borderColor: Colors.transparent,
            focusedBorderColor: Colors.transparent,
            margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            prefixIcon: const Icon(Icons.phone),
          ),
          MyButton(
            text: "Send OTP",
            onTap: () {
              if (formKey.currentState!.validate()) {
                AppUtils.hideKeyboard();
                onLogin("+91${phoneController.text}");
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
