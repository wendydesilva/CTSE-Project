import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_profile_new/DetailPage.dart';
import 'ListPage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListPageState extends State<ListPage>{
  Future getPost() async{
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("student").getDocuments();

    return qn.documents;
  }
  navigateToDetail(DocumentSnapshot post){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post:post)));
  }
  Widget build(BuildContext context){
return Scaffold(
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            width: 400,
            height: 600,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'Students',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20
                    ),
                  ),
                ),
                Container(
                    height: 200,
                    child:FutureBuilder(
                      future : getPost(),
                      builder:  (_, snapshot){
                        return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_,index){
                           return ListTile(
                             title: Text(snapshot.data[index].data["name"]),
                             trailing: FlutterRatingBar(
                               itemSize: 30,
                               initialRating: 3,
                               fillColor: Colors.amber,
                               borderColor: Colors.amber.withAlpha(50),
                               allowHalfRating: true,
                               onRatingUpdate: (rating) {
                                 print(rating);
                               },
                             ),
                             onTap: ()=>navigateToDetail(snapshot.data[index]),




                           );
                        }
                        );
                      },
                    )
                ),
              ],
            ),
          ),
        ),
    ),
);

  }
}