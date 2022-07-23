import 'package:flutter/foundation.dart';
import 'package:instagram_clone/screens/login_screen.dart';

import '../utils/colors.dart';
import 'package:flutter/material.dart';
import '../responsive/web_screen_layout.dart';
import '../responsive/mobile_screen_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import '../responsive/responsive_layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA2xP3mXdy59rqP24Nwgab0uHj9j-klJS4",
          appId: "1:482153551383:web:3d5d5ced87da790c866e52",
          messagingSenderId: "482153551383",
          projectId: "instagram-c85e3",
          storageBucket: 'instagram-c85e3.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayout(
      //   webScreenLayout: WebScreenLayout(),
      //   mobileScreenLayout: MobileScreenLayout(),
      // ),
      home: const LoginScreen(),
    );
  }
}
