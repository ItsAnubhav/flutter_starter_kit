import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/core/constants/app_constants.dart';
import 'package:flutter_starter/core/themes/palette.dart';
import 'package:flutter_starter/presentation/common/custom_container.dart';
import 'package:flutter_starter/presentation/common/my_button.dart';
import 'package:flutter_starter/presentation/common/my_text_field.dart';
import 'package:flutter_starter/presentation/login/bloc/bloc.dart';
import 'package:flutter_starter/presentation/login/login.dart';
import 'package:flutter_starter/core/routes/routes.dart' as routes;

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
                    height: MediaQuery.of(context).size.height/2 - 100,
                    child: Image.network("https://img.freepik.com/free-vector/self-care-illustration-concept_23-2148526939.jpg?w=740&t=st=1674495366~exp=1674495966~hmac=cd69d5c59fab7871b9eb704cfb55890a74120e364802c9cff15389f56c52453d"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                    Padding(padding: EdgeInsets.only(left: 15,right: 15),child: Text("Login",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),)
                  ],),
                  MyTextField(
                    labelText: "Email",
                    onChanged: (data){},
                    borderColor: Colors.transparent,
                    focusedBorderColor: Colors.transparent,
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                    prefixIcon: const Icon(Icons.alternate_email_outlined),
                  ),
                  MyTextField(
                    labelText: "Password",
                    onChanged: (data){},
                    borderColor: Colors.transparent,
                    focusedBorderColor: Colors.transparent,
                    margin: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    isPasswordField: true,
                    prefixIcon: const Icon(Icons.lock_outline),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(padding: const EdgeInsets.only(right: 10),child: TextButton(onPressed: (){}, child: const Text("Forgot Password?",style: TextStyle(color: Palette.primaryColor),)),)
                    ],
                  ),
                  MyButton(
                    text: "Login",
                    onTap: (){},
                    margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),borderRadius: 10,
                  ),
                  const SizedBox(height: 20,),
                  const Text("or login with...",style: TextStyle(color: Colors.grey,fontSize: 17),),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomContainer(borderRadius: 10,borderColor: Colors.grey,width: 100,borderWidth: 0.5,child: Image.asset("assets/images/google_logo.png"),),
                        CustomContainer(borderRadius: 10,borderColor: Colors.grey,width: 100,borderWidth: 0.5,child: Image.asset("assets/images/facebook_logo.png"),),
                        CustomContainer(borderRadius: 10,borderColor: Colors.grey,width: 100,borderWidth: 0.5,child: Image.asset("assets/images/twitter_logo.png"),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  RichText(
                    text: TextSpan(text: 'Do not have an account on ${AppConstants.appName}? ', style: TextStyle(color: Colors.grey), children: [
                      TextSpan(
                        text: 'Register here',
                        style: const TextStyle(
                          color: Palette.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, routes.signup),
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
