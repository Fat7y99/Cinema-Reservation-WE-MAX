import 'package:flutter/material.dart';
import 'package:movie_ticket_app/Provider/provider.dart';
import 'package:movie_ticket_app/components/calendar_day.dart';
import 'package:movie_ticket_app/components/seat_component.dart';
import 'package:movie_ticket_app/components/show_time.dart';
import 'package:movie_ticket_app/Models/movie_model.dart';
import 'package:movie_ticket_app/screens/home_screen.dart';
import 'package:movie_ticket_app/screens/pay_details.dart';
import 'package:movie_ticket_app/components/seat_data.dart';
import '../const.dart';

class BuyTicket2 extends StatefulWidget {
  static int screenRoom = 2;
  final int id;
  const BuyTicket2(this.id);

  @override
  _BuyTicket2State createState() => _BuyTicket2State();
}

class _BuyTicket2State extends State<BuyTicket2> {
  List<int> seatsIndex = [];
  List<SeatData> seats = [
    SeatData(id: 21, isReserved: true),
    SeatData(id: 22, isReserved: true),
    SeatData(id: 23),
    SeatData(id: 24),
    SeatData(id: 25),
    SeatData(id: 26),
    SeatData(id: 27),
    SeatData(id: 28, isReserved: true),
    SeatData(id: 29),
    SeatData(id: 30),
    SeatData(id: 31),
    SeatData(id: 32),
    SeatData(id: 33),
    SeatData(id: 34),
    SeatData(id: 35),
    SeatData(id: 36, isReserved: true),
    SeatData(id: 37, isReserved: true),
    SeatData(id: 38),
    SeatData(id: 39),
    SeatData(id: 40),
    SeatData(id: 41, isReserved: true),
    SeatData(id: 42, isReserved: true),
    SeatData(id: 43),
    SeatData(id: 44),
    SeatData(id: 45, isReserved: true),
    SeatData(id: 46),
    SeatData(id: 47),
    SeatData(id: 48, isReserved: true),
    SeatData(id: 49),
    SeatData(id: 50, isReserved: true),
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
      appBar: AppBar(),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        Visibility(
                          visible: Provider.currentUser!.role == 'user',
                          child: InkWell(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
