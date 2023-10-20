// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:rawinpornorder/utility/app_service.dart';
import 'package:rawinpornorder/widgets/widget_image.dart';

class CheckOtp extends StatelessWidget {
  CheckOtp({
    Key? key,
    required this.verId,
  }) : super(key: key);

  final String verId;

  final StreamController<bool> streamController =
      StreamController<bool>.broadcast();
  final OtpFieldController otpFieldController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const WidgetImage(
                size: 200,
              ),
              OTPTextField(
                controller: otpFieldController,
                width: 250,
                length: 6,
                fieldStyle: FieldStyle.box,
                otpFieldStyle: OtpFieldStyle(
                  borderColor: Colors.deepOrange,
                  enabledBorderColor: Colors.deepOrange,
                ),
                onCompleted: (value) {
                  print('value at onComplete ====== $value');
                  AppService().processCheckOtp(
                      verifyId: verId, otp: value, context: context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  //
}
