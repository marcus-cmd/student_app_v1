import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


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

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(
        fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      print("Profile Picture uploaded");
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Profile Picture Uploaded')));
    });
  }


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
                        radius: 100,
                        backgroundColor: Colors.grey[300],
                        child: ClipOval(
                          child: new SizedBox(
                            width: 180.0,
                            height: 180.0,
                            child: (_image != null) ? Image.file(
                              _image,
                              fit: BoxFit.fill,
                            ) : Image.network(
                              "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.blue,
                          size: 40.0,
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),),
                    SizedBox (height: 50),
                    FloatingActionButton.extended( onPressed: () {
                      uploadPic(context);
                    },
                      icon: Icon(Icons.camera),
                      label: Text('Save Photo'),
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