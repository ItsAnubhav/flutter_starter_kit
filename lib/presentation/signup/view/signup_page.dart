import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/core/routes/routes.dart';
import 'package:flutter_starter/core/themes/palette.dart';
import 'package:flutter_starter/presentation/common/custom_container.dart';
import 'package:flutter_starter/presentation/common/my_button.dart';
import 'package:flutter_starter/presentation/common/my_text_field.dart';
import 'package:flutter_starter/presentation/signup/bloc/bloc.dart';

class SignupPage extends StatelessWidget {

  const SignupPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SignupPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: const Scaffold(
        body: SignupView(),
      ),
    );
  }    
}

class SignupView extends StatelessWidget {

  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/2 - 200,
                child: Image.network("https://img.freepik.com/free-vector/self-care-illustration-concept_23-2148526939.jpg?w=740&t=st=1674495366~exp=1674495966~hmac=cd69d5c59fab7871b9eb704cfb55890a74120e364802c9cff15389f56c52453d"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(padding: EdgeInsets.only(left: 15,right: 15),child: Text("SignUp",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),)
                ],),
              MyTextField(
                labelText: "Full Name",
                onChanged: (data){},
                borderColor: Colors.transparent,
                focusedBorderColor: Colors.transparent,
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                prefixIcon: const Icon(Icons.person_add_alt_outlined),
              ),
              MyTextField(
                labelText: "Email",
                onChanged: (data){},
                borderColor: Colors.transparent,
                focusedBorderColor: Colors.transparent,
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                prefixIcon: const Icon(Icons.alternate_email_outlined),
              ),
              MyTextField(
                labelText: "Mobile No.",
                onChanged: (data){},
                borderColor: Colors.transparent,
                focusedBorderColor: Colors.transparent,
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.local_phone),
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
              Padding(padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),child: RichText(
                text: TextSpan(text: 'By clicking signup, you agree to our ', style: const TextStyle(color: Colors.grey), children: [
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: const TextStyle(
                        color: Palette.primaryColor,
                        fontWeight: FontWeight.normal
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, Routes.signup),
                  ),
                  const TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(
                        color: Palette.primaryColor,
                        fontWeight: FontWeight.normal
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, Routes.signup),
                  )
                ]),
              ),),
              MyButton(
                text: "Create an account",
                onTap: (){},
                margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),borderRadius: 10,
              ),
              const SizedBox(height: 20,),
              const Text("or register with...",style: TextStyle(color: Colors.grey,fontSize: 17),),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 10),
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
                text: TextSpan(text: 'Already have an account? ', style: const TextStyle(color: Colors.grey), children: [
                  TextSpan(
                    text: 'Login here',
                    style: const TextStyle(
                        color: Palette.primaryColor,
                        fontWeight: FontWeight.normal
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, Routes.login),
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
  }
}
