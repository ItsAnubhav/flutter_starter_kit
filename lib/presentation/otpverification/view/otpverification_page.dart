import 'package:flutter/material.dart';
import 'package:flutter_starter/common/boxed_text_field.dart';
import 'package:flutter_starter/common/my_button.dart';
import 'package:flutter_starter/presentation/otpverification/bloc/bloc.dart';

class OtpVerificationPage extends StatelessWidget {
  final String phoneNo;

  const OtpVerificationPage({super.key, required this.phoneNo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OtpverificationBloc(),
        child: OtpVerificationBody(
          phoneNo: phoneNo,
        ));
  }
}

class OtpVerificationBody extends StatelessWidget {
  final String phoneNo;
  String otp = "";

  OtpVerificationBody({super.key, required this.phoneNo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Phone No"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Enter OTP sent to \n$phoneNo",
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            BoxedTextField(
              length: 4,
              onEditingComplete: (String otp) {
                this.otp = otp;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
                text: "Verify",
                margin: const EdgeInsets.all(15),
                onTap: () {
                  // if (otp.length != 4) {
                  //   Get.snackbar("Error", "Invalid OTP");
                  //   return;
                  // }
                  // debugPrint("Verification Code: $verificationId");
                  // // controller.verifyOTP(
                  // //     otp: otp, verificationId: verificationId);
                  // controller.verifyServerOTP(phoneNo, otp);
                })
          ],
        ),
      ),
    );
  }
}
