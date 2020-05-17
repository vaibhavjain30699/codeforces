import 'package:codeforces/screens/settings_screen.dart';
import 'package:codeforces/screens/user_info_detail.dart';
import 'package:flutter/material.dart';
import 'package:codeforces/screens/home_screen.dart';
import 'package:codeforces/screens/splash_screen.dart';
import 'package:codeforces/screens/user_info.dart';
import 'package:codeforces/theme/provider_class.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget widget) {
          return MaterialApp(
            theme: themeChangeProvider.darkTheme
                ? ThemeData.dark()
                : ThemeData.light(),
            routes: {
              '/settings': (context) => SettingsScreen(),
              '/user_info': (context) => UserInfo(),
              '/home': (context) => HomeScreen(),
              '/': (context) => SplashScreen(),
            },
          );
        },
      ),
    );
  }
}
