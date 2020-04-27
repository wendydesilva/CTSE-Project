import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DetailPage.dart';

class DetailPageState extends State<DetailPage>{
  Widget build(BuildContext context){
    return Scaffold(
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
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black45
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(widget.post.data["name"],
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.indigoAccent
                ),),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("Registration Number",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black87
                            ),)
                          ],
                        ),
                        SizedBox(width : 50),
                        Column(
                          children: <Widget>[
                            Text(widget.post.data["regNo"]),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("NIC",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black87
                            ),
                            )
                          ],
                        ),
                        SizedBox(width : 50),
                        Column(
                          children: <Widget>[
                            Text(widget.post.data["NIC"]),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("Parent",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black87
                              ),)
                          ],
                        ),
                        SizedBox(width : 45),
                        Column(
                          children: <Widget>[
                            Text(widget.post.data["parent"]),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black87
                              ),)
                          ],
                        ),
                        SizedBox(width : 35),
                        Column(
                          children: <Widget>[
                            Text(widget.post.data["address"]),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black87
                              ),)
                          ],
                        ),
                        SizedBox(width : 45),
                        Column(
                          children: <Widget>[
                            Text(widget.post.data["email"]),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("Contact Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black87
                              ),)
                          ],
                        ),
                        SizedBox(width : 35),
                        Column(
                          children: <Widget>[
                            Text(widget.post.data["phone"]),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}