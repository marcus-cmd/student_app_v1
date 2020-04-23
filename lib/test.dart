import 'package:flutter/material.dart';

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        appBar: AppBar(
            title: Text('Edit Profile'),
        ),

        body: PageView(
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('This is the profile which other people will see'),
                  SizedBox (height: 30),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      icon: Icon(Icons.person),
                    ),
                    onChanged: (text) {
                      print("$text");
                    },
                  ),
                  SizedBox (height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Field of study',
                      icon: Icon(Icons.account_balance),
                    ),
                    onChanged: (text) {
                      print("$text");
                    },
                  ),
                  SizedBox (height: 20),
                  TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Areas of Expertise',
                      icon: Icon(Icons.book),
                    ),
                    onChanged: (text) {
                      print("$text");
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.deepPurple,
          ),
        ],
      ));
  }}