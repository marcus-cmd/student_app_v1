import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:studentappv1/search.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}



class _StudentListState extends State<StudentList> {

  int counter = 0;

  List<WorldTime> locations = [
    WorldTime(url: 'Physics', location: 'Marcus Zedler', flag: 'uk.png'),
    WorldTime(url: 'IT', location: 'Ruairi O Dwyre', flag: 'greece.png'),
    WorldTime(url: 'Engineering', location: 'Alex Tomus', flag: 'egypt.png'),
    WorldTime(url: 'Engineering', location: 'Thomas Hochuli', flag: 'kenya.png'),
    WorldTime(url: 'IT', location: 'Johann Lindblom', flag: 'usa.png'),
    WorldTime(url: 'Physics', location: 'Martine Poffet', flag: 'usa.png'),
    WorldTime(url: 'IT', location: 'Andreas Haager', flag: 'south_korea.png'),
    WorldTime(url: 'Biology', location: 'Dario Za', flag: 'indonesia.png'),
    WorldTime(url: 'Social Science', location: 'Dirk Oppermann', flag: 'indonesia.png'),
    WorldTime(url: 'Engineering', location: 'Marina Ballester', flag: 'indonesia.png'),
    WorldTime(url: 'Engineering', location: 'Maria Andreu', flag: 'indonesia.png')
  ];
  


@override
  void initState() {
    print('init run');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print('build run');
    return Scaffold(
      backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Ask Me!'),
            actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search),
              onPressed: (){},
    )],
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Ask Me!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyCustomForm())),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                  },
                  title:  Text(locations[index].location),
                  leading: FlutterLogo(),
                  subtitle: Text(locations[index].url),
                  //trailing: Text('17.41')
                ),
              ),
            );
          },
        )
    );
  }
}

class WorldTime {

  String location; //location name for UI
  String time; // time in location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDaytime; //Daytime true or false

  WorldTime({this.location, this.flag, this.url});

}
