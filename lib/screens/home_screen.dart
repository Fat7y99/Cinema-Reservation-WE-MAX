import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/background_gradient_image.dart';
import 'package:movie_ticket_app/components/dark_borderless_button.dart';
import 'package:movie_ticket_app/components/movie_app_bar.dart';
import 'package:movie_ticket_app/components/movie_card.dart';
import 'package:movie_ticket_app/components/primary_rounder_button.dart';
import 'package:movie_ticket_app/components/red_rounded_action_button.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/model.dart';
import 'package:movie_ticket_app/screens/buy_ticket.dart';
import 'package:movie_ticket_app/screens/movie_details.dart';

class MyHomePage extends StatefulWidget {
  int index = 1;

  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final String backgroundImage = movies[widget.index].imageURL;
    final String title = movies[widget.index].title;
    final String startTime = movies[widget.index].startTime;
    final String endTime = movies[widget.index].endTime;
    final String year = movies[widget.index].date.year.toString();
    final String screenRoom = movies[widget.index].screenRoom.toString();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            BackgroundGradientImage(
              image: Image.network(
                backgroundImage,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                const Padding(padding: EdgeInsets.all(10.0)),
                const MovieAppBar(),
                const Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
                DarkBorderlessButton(text: title, callback: () {}),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DarkBorderlessButton(
                      text: 'Popular with Friends',
                      callback: () {},
                    ),
                    DarkBorderlessButton(
                      text: 'Screen: $screenRoom',
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
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetails(
                            title: title,
                            imageURL: backgroundImage,
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
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                            child: MovieCard(
                                title: movies[index].title,
                                imageLink: movies[index].imageURL,
                                active: index == widget.index ? true : false,
                                height: MediaQuery.of(context).size.height *
                                        (1 / movies.length) -
                                    100.0,
                                width: MediaQuery.of(context).size.height *
                                        (1 / movies.length) -
                                    50.0,
                                callBack: () {
                                  setState(() {
                                    widget.index = index;
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
}
