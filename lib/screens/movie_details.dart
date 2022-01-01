// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/movie_app_bar.dart';

class MovieDetails extends StatefulWidget {
  final String title;
  final String age;
  final String categories;
  final String imageURL;
  final String logo;
  final double rating;
  final String technology;
  final String date;

  const MovieDetails(
      {Key? key,
      required this.title,
      this.age = '',
      this.categories = '',
      required this.imageURL,
      this.logo = '',
      this.rating = 4,
      this.technology = '',
      this.date = '01/01/2021'})
      : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    final Color background = Color(0xff302b35);
    final Color fill = Color(0xff252129);
    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];
    final double fillPercent = 30; // fills 56.23% for container from bottom
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final String descip =
        'With Spider-Man\'s identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.';

    return Scaffold(
      body: Container(
        color: fill,
        height: deviceHeight,
        child: SingleChildScrollView(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: gradient,
          //     stops: stops,
          //     end: Alignment.bottomCenter,
          //     begin: Alignment.topCenter,
          //   ),
          // ),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: background,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        height: deviceHeight / 2,
                        width: deviceWidth / 2,
                        child: Image.network(widget.imageURL,
                            // scale: 2,
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: fill,
                  child: Column(
                    children: [
                      Row(
                        //Center Row contents horizontally,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Release date: ',
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Dec. 17 2022',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'Running time: ',
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '210 minutes',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 200.0,
                              child: Text(
                                descip,
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
