import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/calendar_day.dart';
import 'package:movie_ticket_app/components/seat_component.dart';
import 'package:movie_ticket_app/components/show_time.dart';
import 'package:movie_ticket_app/Models/movie_model.dart';
import 'package:movie_ticket_app/screens/home_screen.dart';
import 'package:movie_ticket_app/screens/pay_details.dart';
import 'package:movie_ticket_app/components/seat_data.dart';
import '../const.dart';

class BuyTicket extends StatefulWidget {
  final int id;
  const BuyTicket(this.id);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  List<int> seatsIndex = [];
  List<SeatData> seats = [
    SeatData(id: 0, isReserved: true),
    SeatData(id: 1, isReserved: true),
    SeatData(id: 2),
    SeatData(id: 3),
    SeatData(id: 4),
    SeatData(id: 5),
    SeatData(id: 6),
    SeatData(id: 7, isReserved: true),
    SeatData(id: 8),
    SeatData(id: 9),
    SeatData(id: 10),
    SeatData(id: 11),
    SeatData(id: 12),
    SeatData(id: 13),
    SeatData(id: 14),
    SeatData(id: 15, isReserved: true),
    SeatData(id: 16, isReserved: true),
    SeatData(id: 17),
    SeatData(id: 18),
    SeatData(id: 19),
    SeatData(id: 20, isReserved: true),
    SeatData(id: 21, isReserved: true),
    SeatData(id: 22),
    SeatData(id: 23),
    SeatData(id: 24, isReserved: true),
    SeatData(id: 25),
    SeatData(id: 26),
    SeatData(id: 27, isReserved: true),
    SeatData(id: 28),
    SeatData(id: 29, isReserved: true),
  ];

  void reserveCallBack(int index) {
    if (seatsIndex.contains(seats[index].id)) {
      seatsIndex.remove(seats[index].id);
      seats[index].isSelected = false;
    } else {
      seatsIndex.add(seats[index].id);
      seats[index].isSelected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
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
                  SizedBox(
                    child: Seats(
                      seats: seats,
                      seatsIndex: seatsIndex,
                      reserveCallBack: reserveCallBack,
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
                                builder: (context) => PayDetailsPage()
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
                            child: const Text(
                              'Pay',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
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
    for (SeatData seat in seats) {
      if (seat.isSelected) {
        count++;
      }
    }
    print(seatsIndex);
    seatsIndex.clear();
    return count;
  }
}
