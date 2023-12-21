import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../failure/failures.dart';

class FirebaseAuthService {
  // @override
  // Future<Either<Failure, AuthResponseEntity>> loginWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );

  //     final userCredentials =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     if (userCredentials.user != null) {
  //       //Login user via recieved token

  //       //return Right(user);
  //     } else {
  //       return const Left(ServerFailure("User details not available"));
  //     }
  //   } catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, AuthResponseEntity>> loginWithFacebook() async {
  //   try {
  //     // Trigger the sign-in flow
  //     final loginResult = await FacebookAuth.instance.login();
  //     if (loginResult.accessToken == null) {
  //       return const Left(ServerFailure("User cancelled the login"));
  //     }

  //     // Create a credential from the access token
  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //     // Once signed in, return the UserCredential
  //     final userCredentials = await FirebaseAuth.instance
  //         .signInWithCredential(facebookAuthCredential);

  //     // userCredentials.additionalUserInfo.profile[0]
  //     Map<String, dynamic> dict = {};
  //     dict = userCredentials.additionalUserInfo!.profile!;
  //     String email = dict["email"];
  //     String name = dict["name"];

  //     if (userCredentials.user != null) {
  //       // final user = await authRemoteDataSource.loginViaEmail(
  //       //     email: email,
  //       //     password: "",
  //       //     name: name,
  //       //     source: "fb",
  //       //     token: "",
  //       //     clientId: "client1",
  //       //     clientSecret: "secret",
  //       //     grantType: "password");
  //       // return Right(user);
  //     } else {
  //       return const Left(ServerFailure("User details not available"));
  //     }
  //   } on Exception catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, AuthResponseEntity>> loginWithApple() async {
  //   try {
  //     final appleProvider = AppleAuthProvider();
  //     var userCredentials =
  //         await FirebaseAuth.instance.signInWithProvider(appleProvider);
  //     if (userCredentials.user != null) {
  //       // final user = await authRemoteDataSource.loginViaEmail(
  //       //     email: userCredentials.user!.email!,
  //       //     password: "",
  //       //     name: userCredentials.user!.displayName!,
  //       //     source: "Apple",
  //       //     token: "",
  //       //     clientId: "client1",
  //       //     clientSecret: "secret",
  //       //     grantType: "password");
  //       // return Right(user);
  //     } else {
  //       return const Left(ServerFailure("User details not available"));
  //     }
  //   } on Exception catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }

  @override
  Future<void> verifyPhoneNo({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}
