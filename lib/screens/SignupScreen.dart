// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_ticket_app/components/movie_card.dart';
import 'package:movie_ticket_app/screens/LoginScreen.dart';
import 'package:movie_ticket_app/screens/home_screen.dart';
import 'package:movie_ticket_app/screens/movie_details.dart';
import 'package:movie_ticket_app/Models/user_model.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String dropdownValue = 'Customer';

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(30),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Container(
                        padding: EdgeInsets.only(right: 10),
                        child: TextField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              prefixIcon: Icon(Icons.accessibility_new,
                                  color: Color(0xFF94ADEA)),
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              filled: true,
                              fillColor: Color(0xD000000)),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Container(
                        child: TextField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              prefixIcon: Icon(Icons.accessibility_new,
                                  color: Color(0xFF94ADEA)),
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              filled: true,
                              fillColor: Color(0xD000000)),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        prefixIcon: Icon(Icons.supervised_user_circle,
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
                    controller: emailController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        prefixIcon: Icon(Icons.mail, color: Color(0xFF94ADEA)),
                        hintText: 'Email',
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
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Color(0xFF94ADEA)),
                        hintText: 'Password',
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
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Color(0xFF94ADEA)),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          color: Colors.white70,
                        ),
                        filled: true,
                        fillColor: Color(0xD000000)),
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  elevation: 16,
                  style: const TextStyle(color: Colors.white70),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Customer', 'Manager']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                              text: ' Sign Up ',
                              style: GoogleFonts.bioRhyme(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      // fontWeight: FontWeight.w500,
                                      fontSize: 20)),
                            ),
                          ],
                        ),
                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                            // isUser: dropdownValue == 'Customer'
                            //     ? Users.customer.index
                            //     : Users.manager
                            //     .index//should take movies[widget.index].id
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
