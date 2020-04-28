import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'DetailPage.dart';
import 'package:provider/provider.dart';
import 'Home.dart';
import 'SearchPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   Widget build(BuildContext context){
     return MaterialApp(
       title: 'Student ',
       theme : new ThemeData(
          primarySwatch: Colors.blue,
       ),
      // home: new MyHomePage(),
       home: new Home(),

     );
   }
}

