import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawinpornorder/states/authen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:rawinpornorder/states/check_otp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // คือการทำ thrad (ส่วนของ awit) ให้เสร็จก่อนถึงจะไปทำงานอื่นได้้

  if (kIsWeb) {
    // Web Status

    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBmcUpCb1SER67fmoBqg8Y5YYd4Z1xTF7Q',
          appId: '1:75885504606:web:16d7a01e0d9b4fa4792ccf',
          messagingSenderId: '75885504606',
          projectId: 'rawinpornorder'),
    ).then((value) {
      runApp(const MyApp());
    });
  } else {
    // Mobile or Desktop status
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Authen(),
      // home: CheckOtp(verId: 'verId'),
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade400,
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)),
    );
  }
}
