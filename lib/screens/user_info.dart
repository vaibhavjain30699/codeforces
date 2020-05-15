import 'package:codeforces/networking.dart';
import 'package:codeforces/screens/user_info_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  var searchInputController = TextEditingController();
  String username;
  NetworkHelper _networkHelper = NetworkHelper();
  bool progressStatus = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Builder(
        builder: (context1) => ModalProgressHUD(
          inAsyncCall: progressStatus,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: searchInputController,
                  textAlign: TextAlign.center,
                  onChanged: (newValue) {
                    username = newValue;
                  },
                  onSubmitted: (newValue) {
                    username = newValue;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    hintText: 'Enter Username',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: Text('Search'),
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      progressStatus = true;
                    });
                    var userData =
                        await _networkHelper.getUserDetails(username);
                    setState(() {
                      progressStatus = false;
                    });
                    print(userData);
                    if (userData != null) {
                      if (userData['status'] == 'OK') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UserDetails(
                                userData: userData['result'][0],
                              );
                            },
                          ),
                        );
                      } else {
                        Scaffold.of(context1).showSnackBar(SnackBar(
                          content: Text('No user found'),
                        ));
                      }
                    } else {
                      Scaffold.of(context1).showSnackBar(SnackBar(
                        content: Text('No user found'),
                      ));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
