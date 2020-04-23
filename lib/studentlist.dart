import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:studentappv1/search.dart';
import 'package:studentappv1/faq.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}



class _StudentListState extends State<StudentList> {

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("Ask Me!");



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
          elevation: 20,
          title: cusSearchBar,
            actions: <Widget>[
              IconButton(
                icon: cusIcon,
              onPressed: (){
                  setState(() {
                    if(this.cusIcon.icon == Icons.search){
                      this.cusIcon = Icon(Icons.cancel);
                      this.cusSearchBar = TextField(
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
                            focusColor: Colors.white,
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,                  ),
                      );
                    }
                    else{
                      this.cusIcon = Icon(Icons.search);
                      this.cusSearchBar = Text("Ask Me!");
                    }
                  });
              },
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
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyCustomForm())),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('How To Use the App'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Faq())),
            ),
            ListTile(
              leading: Icon(Icons.face),
              title: Text('Invite Friends'),
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
