import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codeforces/models/color_setter.dart';

class UserDetails extends StatelessWidget {
  UserDetails({this.userData});

  final userData;

  @override
  Widget build(BuildContext context) {
    int rating = (userData['rating'] == null) ? 0 : userData['rating'];
    String name =
        (userData['firstName'] == null && userData['lastName'] == null)
            ? ''
            : userData['firstName'] + userData['lastName'];
    String country = (userData['country'] == null) ? '' : userData['country'];
    int maxRating = (userData['maxRating'] == null) ? 0 : userData['maxRating'];
    String url = 'https:' + userData['titlePhoto'];

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(url),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '${userData['handle']}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorSetter.getUsernameColor(rating),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$name, $country',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Current',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                '${ColorSetter.getUserLevel(rating)}, $rating',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorSetter.getUsernameColor(rating),
                    fontSize: 20.0),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Max',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                '${ColorSetter.getUserLevel(maxRating)}, $maxRating',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorSetter.getUsernameColor(maxRating),
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
