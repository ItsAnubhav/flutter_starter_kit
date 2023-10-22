import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/core/constants/app_constants.dart';
import 'package:flutter_starter/core/routes/routes.dart';
import 'package:flutter_starter/core/themes/palette.dart';
import 'package:flutter_starter/presentation/common_old/custom_container.dart';
import 'package:flutter_starter/presentation/common_old/my_button.dart';
import 'package:flutter_starter/presentation/common_old/my_text_field.dart';
import 'package:flutter_starter/presentation/login/bloc/bloc.dart';
import 'package:flutter_starter/presentation/login/widgets/email_login_widget.dart';
import 'package:flutter_starter/presentation/login/widgets/phone_login_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const Scaffold(
        body: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2 - 100,
                    child: Image.network(
                        "https://img.freepik.com/free-vector/self-care-illustration-concept_23-2148526939.jpg?w=740&t=st=1674495366~exp=1674495966~hmac=cd69d5c59fab7871b9eb704cfb55890a74120e364802c9cff15389f56c52453d"),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  PhoneLoginWidget(
                    onSendOtpClicked: (String phoneNo) {
                      Navigator.pushNamed(context, Routes.otpVerification,
                          arguments: {'phone_no': phoneNo});
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "or login with...",
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomContainer(
                          borderRadius: 10,
                          borderColor: Colors.grey,
                          width: 100,
                          borderWidth: 0.5,
                          child: Image.asset("assets/images/google_logo.png"),
                        ),
                        CustomContainer(
                          borderRadius: 10,
                          borderColor: Colors.grey,
                          width: 100,
                          borderWidth: 0.5,
                          child: Image.asset("assets/images/facebook_logo.png"),
                        ),
                        CustomContainer(
                          borderRadius: 10,
                          borderColor: Colors.grey,
                          width: 100,
                          borderWidth: 0.5,
                          child: Image.asset("assets/images/twitter_logo.png"),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        text:
                            'Do not have an account on ${AppConstants.appName}? ',
                        style: GoogleFonts.nunito(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: 'Register here',
                            style:
                                GoogleFonts.nunito(color: Palette.primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  Navigator.pushNamed(context, Routes.signup),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
