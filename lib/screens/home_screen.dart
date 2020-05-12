import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CodeForces'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Text('Welcome to the App'),
            ),
          ],
        ),
      ),
    );
  }
}
