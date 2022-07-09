import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tiktokclone/constants.dart';
import 'package:tiktokclone/views/screens/auth/login_screen.dart';
import 'package:tiktokclone/views/screens/auth/signup_screen.dart';
// !imp
import 'package:flutter/foundation.dart';


import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// !imp
   if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB__zsVcXr3R29PB-DX9RAY4dqVbNXoKfg",
        appId: "1:1046206902257:web:30e9361f819486d91f5e50",
        messagingSenderId: "1046206902257",
        projectId: "aavash-tiktok",     
        storageBucket: 'aavash-tiktok.appspot.com'
      ),
    ).then((value) {
    Get.put(AuthController());
  });

  }else{

  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });

  }
   

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tiktok Clone",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const SignUp(),
    );
  }
}
