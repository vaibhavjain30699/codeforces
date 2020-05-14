import 'package:flutter/material.dart';
import 'package:codeforces/screens/home_screen.dart';
import 'package:codeforces/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomeScreen(),
        '/': (context) => SplashScreen(),
      },
    );
  }
}
