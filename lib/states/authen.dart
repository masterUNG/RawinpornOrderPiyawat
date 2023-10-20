import 'package:flutter/material.dart';
import 'package:rawinpornorder/utility/app_constant.dart';
import 'package:rawinpornorder/utility/app_service.dart';
import 'package:rawinpornorder/utility/app_snackbar.dart';
import 'package:rawinpornorder/widgets/widget_button.dart';
import 'package:rawinpornorder/widgets/widget_form.dart';
import 'package:rawinpornorder/widgets/widget_image.dart';
import 'package:rawinpornorder/widgets/widget_text.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const WidgetImage(
                size: 300,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: 250,
                decoration: AppConstant().grayBox(),
                child: Column(
                  children: [
                    const WidgetText(data: 'เข้าสู่ระบบด้วยเบอร์โทรศัพท์'),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: WidgetForm(
                        textEditingController: textEditingController,
                        hint: 'เบอร์โทร',
                      ),
                    ),
                    WidgetButton(
                      label: 'ส่งรหัส OTP',
                      pressFunc: () {
                        print('You tab');
                        if (textEditingController.text.trim().isEmpty) {
                          AppSnackBar(
                                  title: 'ยังไม่ได้กรอกเบอร์',
                                  subTitle: 'กรุุณากรอกเบอร์โทรศัพท์ ด้วย ค่ะ',
                                  context: context)
                              .errorSnackBar();
                        } else {

                            AppService().processSentSms(phoneNumber: textEditingController.text, context: context, );



                        }
                      },
                      width: 218,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
