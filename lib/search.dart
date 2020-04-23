import 'package:flutter/material.dart';


// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: PageView(
          children: <Widget>[ Container(
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
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('This is the picture which other people will see'),
                SizedBox(height: 30),
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/bear.jpg'),
                    radius: 100,
                    backgroundColor: Colors.grey,
                  ),
                ),
              SizedBox (height: 50),
              FloatingActionButton.extended( onPressed: () {
                print('Clicked');},
                icon: Icon(Icons.camera),
                label: Text('Upload'),
                autofocus: true,
              ),
              ],
            ),
          ),
        ),
        ]
      ),
    );
  }
}