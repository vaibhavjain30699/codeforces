import 'package:codeforces/networking.dart';
import 'package:codeforces/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codeforces/constants.dart';
import 'package:connectivity/connectivity.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContestData();
  }

  void checkConnectivity() async {
    var connectivity = await (Connectivity().checkConnectivity());
    if (!(connectivity == ConnectivityResult.mobile ||
        connectivity == ConnectivityResult.wifi)) {
      SnackBar snackBar = SnackBar(
        content: Text('No Internet'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  void getContestData() async {
    NetworkHelper networkHelper = NetworkHelper();
    var contestData = await networkHelper.getContestData();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen(
            contestData: contestData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.blue.shade300,
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 103.0,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('images/codeforces_icon.jpeg'),
                            radius: 100.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                        ),
                        TyperAnimatedTextKit(
                          textAlign: TextAlign.center,
                          text: [kTypeWriterAnimatedText],
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pangolin',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
