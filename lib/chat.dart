import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              children: <Widget>[
                RaisedButton (onPressed: () {
                  Navigator.pushNamed(context, '/studentlist');
                     },
                    child: Text('Go to Studentlist')),
              ],
            )
        )
    );
  }
}