// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_ticket_app/Provider/provider.dart';
import 'package:movie_ticket_app/screens/SignupScreen.dart';
import 'package:movie_ticket_app/screens/home_screen.dart';
import 'package:movie_ticket_app/API/request_response.dart';
import 'package:movie_ticket_app/screens/home_screen.dart';
import 'managers_approval.dart';
import 'package:movie_ticket_app/Models/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool pass = false;

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
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
                  controller: userNameController,
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
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                  validator: validatePassword,
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
                    print(userNameController.text);
                    print(passwordController.text);
                    // RequestAndResponses.tempp();
                    print(pass);
                    if (pass) {
                      print("aywaaa");
                      await RequestAndResponses.logIn(
                        userNameController.text.trim(),
                        passwordController.text,
                      );
                      var log;
                      setState(() {
                        if (Provider.currentUser!.role == 'user') {
                          log = Users.user.index;
                          print(Users.user);
                        } else if (Provider.currentUser!.role == 'pending') {
                          log = Users.pending.index;
                          print(Users.pending);
                        } else if (Provider.currentUser!.role == 'manager') {
                          log = Users.manager.index;
                          print(Users.manager);
                        } else if (Provider.currentUser!.role == 'admin') {
                          log = Users.admin.index;
                          print(Users.admin);
                        }
                      });
                      if (log == Users.admin.index) {
                        print("Aw3aa");
                        Provider.users =
                            await RequestAndResponses.getAllUsers();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ManagerApproval(), //should take movies[widget.index].id
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                isUser:
                                    log), //should take movies[widget.index].id
                          ),
                        );
                      }
                    }
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

  String? validatePassword(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password \nShould contain More than 8 characters \nShould contain at least 1 digit and 1 letter';
      } else {
        pass = true;

        return '';
      }
    }
  }
}
