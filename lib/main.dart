import 'package:flutter/material.dart';
import 'package:codeforces/screens/home_screen.dart';
import 'package:codeforces/screens/splash_screen.dart';
import 'package:codeforces/screens/user_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/user_info': (context) => UserInfo(),
        '/home': (context) => HomeScreen(),
        '/': (context) => SplashScreen(),
      },
    );
  }
}
