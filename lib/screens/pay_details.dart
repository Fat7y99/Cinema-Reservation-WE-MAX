// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'package:movie_ticket_app/API/request_response.dart';
import 'package:movie_ticket_app/screens/movie_details.dart';

import '../Models/movie_model.dart';

class PayDetailsPage extends StatefulWidget {
  @override
  _PayDetailsPageState createState() => _PayDetailsPageState();
}

class _PayDetailsPageState extends State<PayDetailsPage> {
  @override
  Widget build(BuildContext context) {
    // final String imageURL = getMovieByID(widget.id).imageURL;
    // final String title = getMovieByID(widget.id).title;
    // final String startTime = getMovieByID(widget.id).startTime;
    // final String endTime = getMovieByID(widget.id).endTime;
    // final String year = getMovieByID(widget.id).date.year.toString();
    // final String screenRoom = getMovieByID(widget.id).screenRoom.toString();

    TextEditingController cardNo = TextEditingController();
    TextEditingController pinNo = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xff302b35),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TextFormField(initialValue: "I am smart"),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      // initialValue: title,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: cardNo,
                      validator: validateCardNo,
                      decoration: InputDecoration(
                          hintText: 'Card Number',
                          hintStyle: TextStyle(
                            color: Colors.white70,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          prefixIcon:
                              Icon(Icons.credit_card, color: Color(0xFF94ADEA)),
                          // hintText: 'Email',
                          // hintStyle: TextStyle(
                          //   color: Colors.white70,
                          // ),
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
                      // initialValue: imageURL,
                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      controller: pinNo,
                      validator: validatePinNo,

                      decoration: InputDecoration(
                          hintText: 'Pin Number',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          prefixIcon: Icon(Icons.pin, color: Color(0xFF94ADEA)),
                          // hintText: 'Email',
                          // hintStyle: TextStyle(
                          //   color: Colors.white70,
                          // ),
                          filled: true,
                          fillColor: Color(0xD000000)),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff252129))),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_circle_down,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: ' Pay ',
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
                        // await FlickrRequestsAndResponses.logIn(
                        //     titleController,
                        //     dateController,
                        //     startController,
                        //     endController,
                        //     screenController,
                        //     imageController);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                isUser:
                                    1), //should take movies[widget.index].id
                          ),
                        );
                        // Navigator.push();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String? validateCardNo(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[0-9]).{16,}$');
    if (value!.isEmpty) {
      return 'Please enter a card number';
    } else {
      if (!regex.hasMatch(value)) {
        return 'It should be 16 digits';
      } else {
        return '';
      }
    }
  }

  String? validatePinNo(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[0-9]).{3,}$');
    if (value!.isEmpty) {
      return 'Enter a valid pin number';
    } else {
      if (!regex.hasMatch(value)) {
        return 'It should be 3 digits';
      } else {
        return '';
      }
    }
  }
}
