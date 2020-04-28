import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'SearchPage.dart';
import 'SearchService.dart';

class SearchPageState extends State<SearchPage>{
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
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0)
                  )
                ),
              ),
            ),
            SizedBox(height: 10.0),
            GridView.count(
              padding: EdgeInsets.only(left: 10.0,right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: studentSearchStore.map((element){
                 return buildResultCard(element);
            }).toList()
            )
          ]
        )
      );
    }
}

Widget buildResultCard(data){
  return ListTile(
   title: Text(data["name"]),
 );
}