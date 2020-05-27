import 'package:codeforces/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.0,
              ),
              CircleAvatar(
                radius: 77.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 75.0,
                  backgroundImage: AssetImage('images/codeforces_icon.jpeg'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 5,
              ),
              Text(
                'Codeforces',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Version : $kVersion',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
