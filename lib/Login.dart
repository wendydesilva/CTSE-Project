import 'package:flutter/material.dart';
import 'MyHomePage.dart';

class Login extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Student Profile"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey
        ),
          child: Center(
            child: Container(
              width: 400,
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("images/logo1.png"),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                    width: 300,

                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20.0),
                        child:TextField(
                          decoration: InputDecoration(
                              hintText: 'Email',
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true
                          ),

                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black
                          ),
                        )
                    ),
                  ),
                  Container(
                    width: 300,

                    child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child:TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true
                          ),

                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black
                              
                          ),
                        )
                    ),
                  ),
                  Container(
                    width: 150,

                    child: FlatButton(
                      onPressed:(){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>MyHomePage()));
                      },
                         child: Text('Login',style: TextStyle(
                            color: Colors.black,
                           fontWeight: FontWeight.bold
                         )),
                      shape: RoundedRectangleBorder(side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid
                      ),borderRadius: BorderRadius.circular(50)
                      ),
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