// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  final String title;
  final String subTitle;
  final BuildContext context;
  AppSnackBar({
    required this.title,
    required this.subTitle,
    required this.context,
  });

  void normalSnackBar() {
    Get.snackbar(title, subTitle);
  }

  void errorSnackBar() {
    Get.snackbar(title, subTitle,
        backgroundColor: Theme.of(context).primaryColor,
        colorText: Colors.white,duration: const Duration(seconds: 5));
  }
}
