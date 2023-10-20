// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:rawinpornorder/utility/app_service.dart';
import 'package:rawinpornorder/widgets/widget_button.dart';
import 'package:rawinpornorder/widgets/widget_image.dart';
import 'package:rawinpornorder/widgets/widget_text.dart';

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
                ),onCompleted: (value) {
                  print('value at onComplete ====== $value');
                  AppService().processCheckOtp(verifyId: verId, otp: value, context: context);
                },
              ),
              // SizedBox(
              //   width: 500,
              //   height: 500,
              //   child: PinCodeWidget(
              //     onEnter: (pin, state) {},
              //     onChangedPin: (pin) {
              //       String currentPin = pin.substring(pin.length - 1);

              //       otpFieldController.setValue(currentPin, pin.length - 1);

              //       if (pin.length == 6) {
                    
              //         AppService().processCheckOtp(verifyId: verId, otp: pin, context: context,);
              //       }
              //     },
              //     filledIndicatorColor: Colors.grey.shade400,
              //     maxPinLength: 6,
              //     buttonColor: Colors.grey.shade400,
              //     borderSide: const BorderSide(color: Colors.deepOrange),
              //     numbersStyle: const TextStyle(
              //       color: Colors.deepOrange,
              //       fontWeight: FontWeight.w600,
              //       fontSize: 30,
              //     ),
              //     deleteButtonColor: Colors.grey.shade400,
              //     deleteIconColor: Colors.deepOrange,
              //   ),
              // ),




            ],
          ),
        ],
      ),
    );
  }

  PasscodeScreen widgetPassCodeScreen() {
    return PasscodeScreen(
        circleUIConfig: CircleUIConfig(
          borderColor: Colors.deepOrange,
          fillColor: Colors.deepOrange,
        ),
        backgroundColor: Colors.grey.shade400,
        keyboardUIConfig: KeyboardUIConfig(
          keyboardSize: Size(250, 250),
          primaryColor: Colors.deepOrange,
          digitTextStyle: TextStyle(
            color: Colors.deepOrange,
            fontSize: 30,
          ),
        ),
        title: Column(
          children: [
            const WidgetImage(
              size: 200,
            ),
            OTPTextField(
              width: 250,
              length: 6,
              fieldStyle: FieldStyle.box,
              otpFieldStyle: OtpFieldStyle(
                borderColor: Colors.deepOrange,
                enabledBorderColor: Colors.deepOrange,
              ),
            ),
          ],
        ),
        passwordEnteredCallback: (text) {
          print('text form een =====================');
        },
        cancelButton: const SizedBox(),
        deleteButton: Container(
          alignment: Alignment.center,
          height: 75,
          width: 75,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            border: Border.all(color: Colors.deepOrange),
            borderRadius: BorderRadius.circular(50),
          ),
          child: WidgetText(
            data: 'Clear',
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        shouldTriggerVerification: streamController.stream);
  }
}
