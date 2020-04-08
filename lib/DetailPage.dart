import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DetailPageState.dart';

class DetailPage extends StatefulWidget{

final DocumentSnapshot post;
DetailPage({this.post});
  DetailPageState createState() => new DetailPageState();
}