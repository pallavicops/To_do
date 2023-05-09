import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/utils/custom_key.dart';
import 'package:to_do/views/auth/login.dart';
import 'package:to_do/views/todo/homepage.dart';

import '../utils/snackbar_service.dart';
import '../views/auth/login_code_verification.dart';

class AuthController {
  String? phoneNumber;
  String? otp;
  String? _verificationId;
  startAuth() {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${phoneNumber!}',
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        Navigator.push(
          CustomKey.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (_) => const LoginCodeVerification(),
          ),
        );
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        FirebaseAuth.instance
            .signInWithCredential(phoneAuthCredential)
            .then((value) {
          Navigator.push(
            CustomKey.navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (_) => const HomePage(),
            ),
          );
        });
      },
      verificationFailed: (FirebaseAuthException error) {
        snackBarService.showNegativeSnackBar(error.message.toString());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  manualLogin() {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId ?? '', smsCode: otp ?? '');

    // Sign the user in (or link) with the credential
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      Navigator.push(
        CustomKey.navigatorKey.currentContext!,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    });
  }

  void listenForLoginStatus() async {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(
          CustomKey.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (_) => const LoginView(),
          ),
        );
      } else {
        Navigator.push(
          CustomKey.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      }
    });
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }
}

final AuthController authController = AuthController();
