import 'package:codeforces/models/problems.dart';
import 'package:flutter/material.dart';
import 'package:codeforces/networking.dart';
import 'package:flutter_tags/flutter_tags.dart';

class ProblemScreen extends StatefulWidget {
  @override
  _ProblemScreenState createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen> {
  Future<List<Problem>> getProblemList() async {
    NetworkHelper networkHelper = NetworkHelper();
    var data = await networkHelper.getProblemsData();
    List<Problem> problems = [];
    for (var temp in data['result']['problems']) {
      if (problems.length > 500) break;
      Problem t = Problem(
        id: temp['contestId'],
        name: temp['name'],
        index: temp['index'],
        points: temp['points'],
        difficulty: temp['rating'],
        tags: temp['tags'],
      );
      problems.add(t);
    }
    return problems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problems'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: FutureBuilder<List<Problem>>(
          future: getProblemList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            snapshot.data[index].name,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          subtitle: (snapshot.data[index].difficulty != null)
                              ? Text(
                                  'Difficulty : ${snapshot.data[index].difficulty}',
                                )
                              : Text(
                                  'Difficulty : unknown',
                                ),
                          trailing: (snapshot.data[index].points != null)
                              ? Text('${snapshot.data[index].points} pts')
                              : null,
                        ),
                        Divider(
                          indent: 10,
                          endIndent: 10,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10),
                          child: Tags(
                            itemCount: snapshot.data[index].tags.length,
                            itemBuilder: (index1) {
                              return ItemTags(
                                index: index1,
                                activeColor: Colors.lightBlueAccent,
                                title: snapshot.data[index].tags[index1],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
