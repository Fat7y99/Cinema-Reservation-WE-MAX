// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_ticket_app/components/movie_card.dart';
import 'package:movie_ticket_app/screens/LoginScreen.dart';
import 'package:movie_ticket_app/screens/home_screen.dart';
import 'package:movie_ticket_app/screens/movie_details.dart';
import 'package:movie_ticket_app/Models/user_model.dart';
import 'package:movie_ticket_app/API/request_response.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../const.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String dropdownValue = 'User';
  bool passOne = false;
  bool passTwo = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
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
                        prefixIcon:
                            Icon(Icons.person, color: Color(0xFF94ADEA)),
                        hintText: 'UserName',
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
                  child: TextFormField(
                    validator: validatePassword,
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
                  child: TextFormField(
                    validator: validatePassword1,
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
                  items: <String>['User', 'Manager']
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

                      onPressed: () async {
                        var role;
                        setState(() {
                          role = dropdownValue == 'User' ? 'user' : 'pending';
                        });
                        if ((passOne && passTwo) &&
                            (passwordController.text ==
                                confirmPasswordController.text)) {
                          int statusCode = await RequestAndResponses.signUp(
                              userNameController.text.trim(),
                              firstNameController.text.trim(),
                              lastNameController.text.trim(),
                              emailController.text.trim(),
                              passwordController.text,
                              role);

                          if (statusCode == 200 || statusCode == 201) {
                            Alert(
                              context: context,
                              title: "You are registered successfully",
                              // desc: "Flutter is better with RFlutter Alert.",
                              image: Image.asset(
                                "assets/images/success.png",
                                scale: 10,
                              ),

                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Ok",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
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
                                  color: kBackgroundColor,
                                  radius: BorderRadius.circular(0.0),
                                ),
                              ],
                            ).show();
                          } else {
                            Alert(
                              context: context,
                              title: "Please check your input again",
                              //TODO show the specified message
                              // desc: "Flutter is better with RFlutter Alert.",
                              image: Image.asset(
                                "assets/images/failure.png",
                                scale: 10,
                              ),

                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Ok",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  color: kBackgroundColor,
                                  radius: BorderRadius.circular(0.0),
                                ),
                              ],
                            ).show();
                          }
                        }
                      },
                    )),
              ],
            ),
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
        return 'Enter valid password \nNot matched\nShould contain More than 8 characters \nShould contain at least 1 digit and 1 letter';
      } else {
        passOne = true;

        return '';
      }
    }
  }

  String? validatePassword1(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password \nNot matched\nShould contain More than 8 characters \nShould contain at least 1 digit and 1 letter';
      } else {
        passTwo = true;
        return '';
      }
    }
  }
}
