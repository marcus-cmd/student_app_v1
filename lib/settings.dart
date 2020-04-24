import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isSwitched = true;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: PageView(children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Do you like to save your Data on our Servers'),
                SizedBox(height: 10),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setUpdate(() {
                      isSwitched = value;
                    });
                  },
                  //activeTrackColor: Colors.grey,
                  //activeColor: Colors.white,
                ),
                Text('Do you like to get asked by other community memebers?'),
                SizedBox(height: 10),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setUpdate(() {
                      isSwitched = value;
                    });
                  },
                ),
                Text('Do you like to show your success stars?'),
                SizedBox(height: 10),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setUpdate(() {
                      isSwitched = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('TBD'),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void setUpdate(Null Function() param0) {}
}
