import 'package:flutter/material.dart';
import 'package:flutter_starter/core/themes/palette.dart';
import 'package:flutter_starter/core/utility/ColorUtils.dart';
import 'package:flutter_starter/presentation/common_old/my_button.dart';
import 'package:flutter_starter/presentation/common_old/my_text_field.dart';
import 'package:flutter_starter/presentation/forgetpass/bloc/bloc.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetpassBloc, ForgetpassState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "Forgot Password ?",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "Send a password reset link your registered email address",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  MyTextField(
                    labelText: "Email",
                    onChanged: (data) {},
                    borderColor: Colors.transparent,
                    focusedBorderColor: Colors.transparent,
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                    prefixIcon: const Icon(Icons.alternate_email_outlined),
                    validator: (value) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    text: "Reset Password",
                    onTap: () {},
                    margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                    borderRadius: 10,
                  ),
                ],
              ),
            ));
      },
    );
  }
}


// const SizedBox(width: 10,),
