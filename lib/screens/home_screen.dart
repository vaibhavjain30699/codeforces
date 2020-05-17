import 'package:codeforces/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codeforces/constants.dart';
import 'package:codeforces/components/drawer_list_item.dart';
import 'package:codeforces/models/contests.dart';
import 'package:provider/provider.dart';
import 'package:codeforces/theme/provider_class.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.contestData});
  final contestData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerSelection selectedItem = DrawerSelection.Contests;
  List<Contest> contest = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContestsList();
  }

  void getContestsList() {
    contest.clear();
    for (var temp in widget.contestData['result']) {
      if (contest.length >= 150) break;
      double duration = temp['durationSeconds'] / 3600;
      Contest t = Contest(
          id: temp['id'],
          type: temp['type'],
          name: temp['name'],
          duration: duration);
      contest.add(t);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('CodeForces'),
      ),
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/codeforces_icon.jpeg'),
                    radius: 35.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Codeforces'),
                ],
              ),
            ),
            DrawerListItem(
              item: DrawerSelection.Contests,
              labelText: 'Contests',
              icon: Icon(Icons.list),
              onTap: () async {
                if (selectedItem == DrawerSelection.Contests)
                  Navigator.pop(context);
                else {
                  Navigator.pop(context);
                  NetworkHelper network = NetworkHelper();
                  var contestData = await network.getContestData();
                  Navigator.push(
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
                setState(() {
                  selectedItem = DrawerSelection.Contests;
                });
              },
              selectedItem: selectedItem,
            ),
            DrawerListItem(
              item: DrawerSelection.UserInfo,
              labelText: 'UserInfo',
              icon: Icon(Icons.search),
              onTap: () {
                if (selectedItem == DrawerSelection.UserInfo)
                  Navigator.pop(context);
                else {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/user_info');
                }
              },
              selectedItem: selectedItem,
            ),
            DrawerListItem(
              item: DrawerSelection.Settings,
              labelText: 'Settings',
              icon: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
              selectedItem: selectedItem,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: contest.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: themeChange.darkTheme
                    ? Color(0xFF0288D1)
                    : Color(0xFFE1F5FE),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: Text('#${contest[index].id} ${contest[index].name}'),
                subtitle: Text(contest[index].type),
                trailing:
                    Text('${contest[index].duration.toStringAsFixed(1)} hr'),
              ),
            ),
          );
        },
      ),
    );
  }
}
