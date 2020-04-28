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
  deleteData(DocumentSnapshot doc)async{
    var firestore = Firestore.instance;
    return showDialog(context: context,builder : (BuildContext context){
      return AlertDialog(
        title: Text("Confirm delete"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          child: Text("Yes"),
                          onTap: (){
                            firestore.collection("student").document(doc.documentID).delete();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    SizedBox(width: 100),
                    Column(
                      children: <Widget>[
                        /*GestureDetector(
                          child: Text("No"),
                          onTap: () => Navigator.of(context).pop(),
                        )*/
                        GestureDetector(
                          child: FlatButton(
                            color: Colors.red,
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("No",style: TextStyle(
                              color: Colors.white,
                                  fontWeight: FontWeight.bold
                            )),

                          ),
                        )
                      ],
                    )
                  ],
              )


            ],
          ),
        ),
      );
    });


  }
  OpenDeleteDialog(){

    return AlertDialog(
      title: Text("Confirm delete"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            GestureDetector(
              child: Text("Yes"),
              onTap: (){

              },
            )
          ],
        ),
      ),
    );
  }
  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post:post)));
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        //width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            width: 400,
            height: 600,
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("Reviews",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width : 100),
                          Column(
                            children: <Widget>[
                              Text("Reviews",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height : 10),
                Container(
                    height: 400,
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
                               leading: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: ()=> deleteData(snapshot.data[index]),
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