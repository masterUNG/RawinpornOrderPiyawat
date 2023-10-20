import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawinpornorder/states/check_otp.dart';
import 'package:rawinpornorder/utility/app_snackbar.dart';

class AppService {
  Future<void> processSentSms(
      {required String phoneNumber, required BuildContext context}) async {
    print('phonenumber =====> $phoneNumber');

    String userPhone = '+66${phoneNumber.substring(1)}';

    // format phone ---. +66 99 249 2635

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: userPhone,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        AppSnackBar(
            title: 'Error',
            subTitle: error.message ?? 'กรุณาเปลี่ยนเบอร์ใหม่ เบอร์ผิด',
            context: context);
      },
      codeSent: (verificationId, forceResendingToken) {
        print('############ VerID ===> $verificationId');

        Get.offAll(CheckOtp(verId: verificationId));
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future<void> processCheckOtp(
      {required String verifyId,
      required String otp,
      required BuildContext context}) async {
    FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: verifyId, smsCode: otp))
        .then((value) {

          
        })
        .catchError((onError) {
          print('onError ----------- $onError');
      AppSnackBar(title: onError, subTitle: onError.message, context: context).errorSnackBar();
    });
  }
}
