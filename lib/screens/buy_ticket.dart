import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/calendar_day.dart';
import 'package:movie_ticket_app/components/cienma_seat.dart';
import 'package:movie_ticket_app/components/show_time.dart';
import 'package:movie_ticket_app/movie_model.dart';
import 'package:movie_ticket_app/screens/home_screen.dart';

import '../const.dart';

class BuyTicket extends StatefulWidget {
  final int id;
  const BuyTicket(this.id);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  List<int> seatsIndex = [];
  List<CienmaSeat> seats = [
    CienmaSeat(id: 0),
    CienmaSeat(id: 1),
    CienmaSeat(id: 2),
    CienmaSeat(id: 3),
    CienmaSeat(id: 4),
    CienmaSeat(id: 5),
    CienmaSeat(id: 6),
    CienmaSeat(id: 7),
    CienmaSeat(id: 8),
    CienmaSeat(id: 9),
    CienmaSeat(id: 10),
    CienmaSeat(id: 11),
    CienmaSeat(id: 12),
    CienmaSeat(id: 13),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * .12,
                          height: MediaQuery.of(context).size.width * .12,
                          decoration: kRoundedFadedBorder,
                          child: IconButton(
                              icon: const Icon(
                                Icons.keyboard_arrow_left,
                                size: 28.0,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .75,
                          child: Text(
                            (getMovieByID(widget.id)).title,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.5,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        ShowTime(
                          time: '11:00',
                          price: 5,
                          isActive: false,
                        ),
                        ShowTime(
                          time: '12:30',
                          price: 10,
                          isActive: true,
                        ),
                        ShowTime(
                          time: '12:30',
                          price: 10,
                          isActive: false,
                        ),
                        ShowTime(
                          time: '12:30',
                          price: 10,
                          isActive: false,
                        ),
                        ShowTime(
                          time: '12:30',
                          price: 10,
                          isActive: false,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/screen.png',
                      width: MediaQuery.of(context).size.width,
                      scale: 0.25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: seats[0],
                              onTap: () {
                                setState(() {
                                  if (seatsIndex.contains(seats[0].id)) {
                                    seatsIndex.remove(seats[0].id);
                                  } else {
                                    seatsIndex.add(seats[0].id);
                                  }
                                });
                              },
                            ),
                            seats[1],
                            seats[2],
                            seats[3],
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width / 20) * 2,
                            ),
                            seats[4],
                            seats[5],
                            seats[6],
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            seats[7],
                            seats[8],
                            seats[9],
                            seats[10],
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width / 20) * 2,
                            ),
                            seats[11],
                            seats[12],
                            seats[13],
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          print(countR());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage(isUser: true)
                                //should take movies[widget.index].id
                                ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 25.0),
                            decoration: const BoxDecoration(
                              color: kPimaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                              ),
                            ),
                            child: Text('Pay',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  int countR() {
    int count = 0;
    for (CienmaSeat seat in seats) {
      if (seat.isSelected) {
        count++;
        if (seatsIndex.contains(seat.id)) {
          seatsIndex.remove(seat.id);
        } else {
          seatsIndex.add(seat.id);
        }
      }
    }
    print(seatsIndex);
    return count;
  }
}
