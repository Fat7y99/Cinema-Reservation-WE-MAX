// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_ticket_app/API/request_response.dart';
import 'package:movie_ticket_app/Provider/provider.dart';
import 'package:movie_ticket_app/components/background_gradient_image.dart';
import 'package:movie_ticket_app/components/dark_borderless_button.dart';
import 'package:movie_ticket_app/components/movie_card.dart';
import 'package:movie_ticket_app/components/primary_rounder_button.dart';
import 'package:movie_ticket_app/components/red_rounded_action_button.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/Models/movie_model.dart';
import 'package:movie_ticket_app/screens/reservation_screen.dart';
import 'package:movie_ticket_app/screens/movie_details.dart';
import 'package:movie_ticket_app/screens/movie_insert.dart';
import 'package:movie_ticket_app/screens/managers_approval.dart';
import 'LoginScreen.dart';
import 'package:movie_ticket_app/API/request_response.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class MyHomePage extends StatefulWidget {
  int index = 0;
  int isUser;

  MyHomePage({required this.isUser});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final int id = Provider.movies[widget.index].id;
    final String imageURL = Provider.movies[widget.index].imageURL;
    final String title = Provider.movies[widget.index].title;
    final DateTime startTime = Provider.movies[widget.index].startTime;
    final DateTime endTime = Provider.movies[widget.index].endTime;
    final String year = Provider.movies[widget.index].startTime.year.toString();
    final String screenRoom =
        Provider.movies[widget.index].screenRoom.toString();
    print("done");
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
        actions: [
          Visibility(
            visible: Provider.currentUser!.role == 'manager',
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MovieInsertPage(), //should take movies[widget.index].id
                    ),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: kPimaryColor,
                )),
          ),
          Visibility(
            visible: Provider.currentUser!.role == 'user',
            child: IconButton(
                onPressed: () async {
                  Provider.reservations =
                      await RequestAndResponses.getAllReservations(
                          Provider.currentUser!.id);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ReservationScreen(), //should take movies[widget.index].id
                    ),
                  );
                },
                icon: Icon(
                  Icons.tv,
                  color: kPimaryColor,
                )),
          ),
          IconButton(
              onPressed: () async {
                await RequestAndResponses.logout();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginPage(), //should take movies[widget.index].id
                  ),
                );
              },
              icon: Icon(
                Icons.logout,
                color: kPimaryColor,
              )),
        ],
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            BackgroundGradientImage(
              image: Image.network(
                imageURL,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                const Padding(padding: EdgeInsets.all(10.0)),

                const Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     DarkBorderlessButton(text: title, callback: () {}),
                //     // ElevatedButton(
                //     //   onPressed: () {
                //     //
                //     //   },
                //     //   child: Icon(Icons.add, color: Colors.white),
                //     //   style: ElevatedButton.styleFrom(
                //     //     shape: CircleBorder(),
                //     //     padding: EdgeInsets.all(20),
                //     //     primary: Colors.blue, // <-- Button color
                //     //     onPrimary: Colors.white, // <-- Splash color
                //     //   ),
                //     // ),
                //   ],
                // ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DarkBorderlessButton(
                      text: 'Screen: #$screenRoom',
                      callback: () {},
                    ),
                    PrimaryRoundedButton(
                      text: 'From $startTime to $endTime',
                      callback: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          year,
                          style: kSmallMainTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset('assets/images/divider.png'),
                RedRoundedActionButton(
                    text: 'Movie Details',
                    callback: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetails(
                            id: widget.index,
                            isUser: widget.isUser,
                          ), //should take movies[widget.index].id
                        ),
                      );
                    }),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: Provider.movies.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                            child: MovieCard(
                                title: Provider.movies[index].title,
                                imageLink: Provider.movies[index].imageURL,
                                active: index == widget.index ? true : false,
                                height: MediaQuery.of(context).size.height *
                                        (1 / Provider.movies.length) -
                                    100.0,
                                width: MediaQuery.of(context).size.height *
                                        (1 / Provider.movies.length) -
                                    50.0,
                                callBack: () {
                                  setState(() {
                                    widget.index = index;
                                    print(widget.isUser);
                                  });
                                }),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Future<String> ay7aga() async {
  //   const String baseURL =
  //       'https://a1a0f024-6781-4afc-99de-c0f6fbb5d73d.mock.pstmn.io/user/about/5';
  //
  //   var response = await http.get(
  //     Uri.parse(baseURL),
  //   );
  //   print(response.body);
  //
  //   return response.body;
  // }
}
