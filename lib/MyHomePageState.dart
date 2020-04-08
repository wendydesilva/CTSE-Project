import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'ListPage.dart';

class MyHomePageState extends State<MyHomePage>{
  Widget build(BuildContext context){
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Student Profile"),
      ),
      drawer: new Drawer(
        child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                 // accountName: new Text("Student Profile"),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/sliitlogo.png"),
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
                new ListTile(
                  title: new Text("First Page"),
                  trailing: new Icon(Icons.arrow_upward),
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Second Page"),
                  trailing: new Icon(Icons.arrow_right),
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Close"),
                  trailing: new Icon(Icons.cancel),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
        ),
      ),

      backgroundColor: Colors.blue,

      body:ListPage(),

    );
  }
}