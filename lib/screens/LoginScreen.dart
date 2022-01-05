// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_ticket_app/screens/SignupScreen.dart';
import 'package:movie_ticket_app/screens/home_screen.dart';
import 'package:movie_ticket_app/API/request_response.dart';
import 'package:movie_ticket_app/screens/home_screen.dart';
import 'managers_approval.dart';
import 'package:movie_ticket_app/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff302b35),
              Color(0xff302b35),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(60),
                  child: RichText(
                    text: TextSpan(
                      //   style: Theme.of(context).textTheme.body1,
                      children: [
                        TextSpan(
                          text: 'WeMAX ',
                          style: GoogleFonts.pacifico(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30)),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.movie,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      prefixIcon: Icon(Icons.accessibility_new,
                          color: Color(0xFF94ADEA)),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      ),
                      filled: true,
                      fillColor: Color(0xD000000)),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      prefixIcon: Icon(Icons.lock_outline_rounded,
                          color: Color(0xFF94ADEA)),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      ),
                      filled: true,
                      fillColor: Color(0xD000000)),
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                    onSurface: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: () {
                    print("Aywa");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                            isUser: Users.guest
                                .index), //should take movies[widget.index].id
                      ),
                    );

                    //forgot password screen
                  },
                  // textColor: Colors.blue,
                  child: Text(
                    'Login as guest',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   primary: Colors.transparent, // background
                  // ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff252129))),
                  child: RichText(
                    text: TextSpan(
                      //   style: Theme.of(context).textTheme.body1,
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_circle_down,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: ' Login ',
                          style: GoogleFonts.bioRhyme(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.w500,
                                  fontSize: 20)),
                        ),
                      ],
                    ),
                  ),

                  onPressed: () async {
                    print(nameController.text);
                    print(passwordController.text);
                    RequestAndResponses.tempp();
                    await RequestAndResponses.logIn(
                      nameController,
                      passwordController,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                            isUser: 0), //should take movies[widget.index].id
                      ),
                    );

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MyHomePage(
                    //         isUser: true), //should take movies[widget.index].id
                    //   ),
                    // );
                    // Navigator.push();
                  },
                ),
              ),
              Container(
                  child: Row(
                children: <Widget>[
                  // ignore: prefer_const_constructors
                  Text(
                    'No account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      //signup screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SignupPage(), //should take movies[widget.index].id
                        ),
                      );
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
