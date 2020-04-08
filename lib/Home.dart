import 'package:flutter/material.dart';
import 'Login.dart';

class Home extends StatelessWidget{
      Widget build(BuildContext context){

        return Scaffold(
           body: Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("images/home1.png"),
                 fit: BoxFit.cover
               )
             ),
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             child: Center(
               child: Container(
                 width: 400,
                 height: 600,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     Container(
                       height: 200,
                       child: Text(
                         'Student Profiles',
                         style: TextStyle(
                           fontSize: 25,
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                     Container(
                       width: 200,
                       height: 50,
                       child:FlatButton(
                           onPressed:(){
                             Navigator.push(context,
                                   MaterialPageRoute(builder: (context)=>Login()));
                           },
                         child: Text('Login', style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold
                         )
                         ),
                         textColor: Colors.white,
                         shape: RoundedRectangleBorder(side: BorderSide(
                             color: Colors.white,
                             width: 1,
                             style: BorderStyle.solid
                         ), borderRadius: BorderRadius.circular(50)),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
        );
      }
}