import 'package:flutter/material.dart';
import 'package:studentappv1/chat.dart';
import 'package:studentappv1/loading.dart';
import 'package:studentappv1/studentlist.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/studentlist',
  routes: {
    '/': (context) => Loading(),
    '/chat': (context) => Chat(),
    '/studentlist': (context) => StudentList(),
  },
));