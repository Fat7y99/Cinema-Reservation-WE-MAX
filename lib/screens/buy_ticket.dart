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

class BuyTicket extends StatefulWidget {
  static int screenRoom = 1;
  final int id;
  const BuyTicket(this.id);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  List<int> seatsIndex = [];

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
                        Provider.movies[widget.id].title,
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
                                    builder: (context) =>
                                        PayDetails(id: widget.id)
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
    setState(() {
      Provider.reserveModel.seats = seatsIndex;
    });
    return Provider.reserveModel.seats.length;
  }
}
