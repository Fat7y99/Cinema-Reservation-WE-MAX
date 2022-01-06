// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_ticket_app/API/request_response.dart';
import 'package:movie_ticket_app/screens/movie_details.dart';

import '../movie_model.dart';

class MovieEditPage extends StatefulWidget {
  final int id;

  const MovieEditPage({required this.id});
  @override
  _MovieEditPageState createState() => _MovieEditPageState();
}

class _MovieEditPageState extends State<MovieEditPage> {
  @override
  Widget build(BuildContext context) {
    final String imageURL = getMovieByID(widget.id).imageURL;
    final String title = getMovieByID(widget.id).title;
    final String startTime = getMovieByID(widget.id).startTime;
    final String endTime = getMovieByID(widget.id).endTime;
    final String year = getMovieByID(widget.id).date.toString();
    final String screenRoom = getMovieByID(widget.id).screenRoom.toString();

    TextEditingController titleController = TextEditingController(text: title);
    TextEditingController imageController =
        TextEditingController(text: imageURL);
    TextEditingController dateController = TextEditingController(text: year);
    TextEditingController startController =
        TextEditingController(text: startTime);
    TextEditingController endController = TextEditingController(text: endTime);
    TextEditingController screenController =
        TextEditingController(text: screenRoom);

    return Scaffold(
      backgroundColor: Color(0xff302b35),
      appBar: AppBar(),
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
                      controller: titleController,
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
                              Icon(Icons.movie, color: Color(0xFF94ADEA)),
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
                      controller: imageController,
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
                              Icon(Icons.image, color: Color(0xFF94ADEA)),
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
                      // initialValue: startTime,
                      controller: startController,
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
                              Icon(Icons.timelapse, color: Color(0xFF94ADEA)),
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
                      // initialValue: endTime,
                      controller: endController,
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
                              Icon(Icons.timelapse, color: Color(0xFF94ADEA)),
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
                      // initialValue: year,
                      controller: dateController,
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
                              Icon(Icons.date_range, color: Color(0xFF94ADEA)),
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
                      // initialValue: screenRoom,
                      controller: screenController,
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
                              Icon(Icons.monitor, color: Color(0xFF94ADEA)),
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
                              text: ' Submit ',
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
                        Navigator.pop(context);
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
}
