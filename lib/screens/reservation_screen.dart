import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/movie_model.dart';
import 'package:movie_ticket_app/reservation_model.dart';

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  List<ReservationModel> reservations = [
    ReservationModel(
        id: 1, movieId: 1, userId: 2, seatCount: 10, roomNumber: 3),
    ReservationModel(
        id: 2, movieId: 2, userId: 2, seatCount: 10, roomNumber: 3),
    ReservationModel(
        id: 3, movieId: 3, userId: 2, seatCount: 10, roomNumber: 3),
    ReservationModel(
        id: 4, movieId: 4, userId: 2, seatCount: 10, roomNumber: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title:
              Text("Your Reservations", style: TextStyle(color: kPimaryColor))),
      body: ListView.builder(
          itemCount: reservations.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                color: Color(0xff302b35),
                elevation: 10.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(getMovieByID(reservations[index].id).title,
                          style: TextStyle(
                              color: kPimaryColor,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          "Room Number: ${reservations[index].roomNumber}",
                          style: TextStyle(
                              color: kPimaryColor,
                              fontWeight: FontWeight.bold)),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            reservations.remove(reservations[index]);
                          });
                        },
                        icon: Icon(Icons.cancel),
                        color: Colors.red[400],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          " Reserved Seats: ${reservations[index].seatCount}",
                          style: TextStyle(color: kPimaryColor)),
                    ),
                  ],
                ));
          }),
    );
  }
}
