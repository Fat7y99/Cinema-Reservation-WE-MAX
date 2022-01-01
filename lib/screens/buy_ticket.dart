import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/calendar_day.dart';
import 'package:movie_ticket_app/components/cienma_seat.dart';
import 'package:movie_ticket_app/components/show_time.dart';
import 'package:movie_ticket_app/model.dart';

import '../const.dart';

class BuyTicket extends StatefulWidget {
  final id;
  const BuyTicket(this.id, {Key? key}) : super(key: key);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
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
    CienmaSeat(id: 13)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Expanded(
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
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
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      topLeft: Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const <Widget>[
                          CalendarDay(
                            dayNumber: '9',
                            dayAbbreviation: 'TH',
                          ),
                          CalendarDay(
                            dayNumber: '10',
                            dayAbbreviation: 'FR',
                          ),
                          CalendarDay(
                            dayNumber: '11',
                            dayAbbreviation: 'SA',
                          ),
                          CalendarDay(
                            dayNumber: '12',
                            dayAbbreviation: 'SU',
                            isActive: true,
                          ),
                          CalendarDay(
                            dayNumber: '13',
                            dayAbbreviation: 'MO',
                          ),
                        ],
                      ),
                    ),
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        Icons.tv,
                        color: kPimaryColor,
                        size: 25.0,
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Star Cineplex Bangladesh',
                                style: kMainTextStyle),
                            const Text('panthapath , 1205 Dhaka, Bangladesh',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white30, fontSize: 18.0)),
                            const SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Text('2D', style: kMainTextStyle),
                                const SizedBox(width: 10.0),
                                const Text('3D',
                                    style: TextStyle(
                                        color: Colors.white30,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Colors.white38,
                      )
                    ],
                  ),
                ),
                Center(child: Image.asset('assets/images/screen.png')),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          seats[0],
                          seats[1],
                          seats[2],
                          seats[3],
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
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
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          seats[11],
                          seats[12],
                          seats[13],
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Text(
                        '30\$',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10.0),
                      decoration: const BoxDecoration(
                          color: kActionColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0))),
                      child: InkWell(
                          onTap: () {
                            print(countR());
                          },
                          child: Text('Pay',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold))),
                    )
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  int countR() {
    int count = 0;
    for (CienmaSeat seat in seats) {
      if (seat.isSelected) {
        count++;
      }
    }
    return count;
  }
}
