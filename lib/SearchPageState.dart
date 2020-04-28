import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'SearchPage.dart';
import 'SearchService.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:student_profile_new/DetailPage.dart';

class SearchPageState extends State<SearchPage>{
  Future getPost() async{
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("student").getDocuments();

    return qn.documents;
  }
  void deleteData(DocumentSnapshot doc)async{
    var firestore = Firestore.instance;
    await firestore.collection("student").document(doc.documentID).delete();

  }
  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post:post)));
  }

  var queryResultSet = [];
  var studentSearchStore = [];

  intiateSearch(value){
    if(value.length == 0){
      setState(() {
        queryResultSet = [];
        studentSearchStore = [];
      });
    }
    var capitalizedValue =
        value.substring(0,1).toUpperCase() + value.substring(1);
    if(queryResultSet.length == 0 && value.length == 1){
          SearchService().searchByName(value).then((QuerySnapshot docs){
            for(int i = 0; i < docs.documents.length; ++i){
               queryResultSet.add(docs.documents[i].data);
            }
          });
    }
    else{
      studentSearchStore = [];
      queryResultSet.forEach((element){
        if(element["name"].startsWith(capitalizedValue)){
          setState(() {
            studentSearchStore.add(element);
          });
        }
      });
    }

  }

    Widget build(BuildContext context){
      return new Scaffold(
        body:
        ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(1),

              child: TextField(
                onChanged: (val){
                  intiateSearch(val);
                },
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                //contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0)
                  )
                ),
              ),
            ),
            SizedBox(height: 10.0),

           /*GridView(
              padding: EdgeInsets.only(left: 1.0,right: 1.0),
              //crossAxisCount: 2,
              //childAspectRatio: 0.75,
              //crossAxisSpacing: 1.0,
              //mainAxisSpacing: 1,

              primary: false,
             shrinkWrap: true,

                children: studentSearchStore.map((element){
                 return buildResultCard(element);
            }).toList()
            )*/
          ]
        )
      );
    }
}

Widget buildResultCard(data){

  return Container(
   // width: 10,
    child: Row(
      children: <Widget>[
       Expanded(
         child: Row(
           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             Text(data["name"]),
             SizedBox(width : 100),
             FlutterRatingBar(
               itemSize: 30,
               initialRating: 3,
               fillColor: Colors.amber,
               borderColor: Colors.amber.withAlpha(50),
               allowHalfRating: true,
               onRatingUpdate: (rating) {
                 print(rating);
               },
             ),
           ],
         ),
       ),

       /* Column(
          children: <Widget>[
            FlutterRatingBar(
              itemSize: 30,
              initialRating: 3,
              fillColor: Colors.amber,
              borderColor: Colors.amber.withAlpha(50),
              allowHalfRating: true,
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ],
        )*/
      ],
    ),
  );
}