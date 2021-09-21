import 'package:flutter/material.dart';
import 'package:mobile_app/pages/home/main_page.dart';
import 'package:mobile_app/pages/sign_in_page.dart';
import 'package:mobile_app/pages/sign_up_page.dart';
import 'package:mobile_app/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/home': (context) => const MainPage()
      },
    );
  }
}
