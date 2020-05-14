import 'package:flutter/material.dart';
import 'package:codeforces/constants.dart';
import 'package:codeforces/components/drawer_list_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.contestData});

  final contestData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerSelection selectedItem = DrawerSelection.Contests;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CodeForces'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Welcome to the App'),
            ),
            DrawerListItem(
              item: DrawerSelection.Contests,
              labelText: 'Contests',
              onTap: () {
                Navigator.pop(context);
              },
              selectedItem: selectedItem,
            ),
            DrawerListItem(
              item: DrawerSelection.UserInfo,
              labelText: 'UserInfo',
              onTap: () {},
              selectedItem: selectedItem,
            ),
            DrawerListItem(
              item: DrawerSelection.Settings,
              labelText: 'Settings',
              onTap: () {},
              selectedItem: selectedItem,
            ),
          ],
        ),
      ),
    );
  }
}
