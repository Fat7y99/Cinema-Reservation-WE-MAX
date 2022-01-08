import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/Models/movie_model.dart';
import 'package:movie_ticket_app/Models/reservation_model.dart';
import 'package:movie_ticket_app/Models/user_model.dart';
import 'package:movie_ticket_app/Models/seat_model.dart';
import 'package:movie_ticket_app/Models/room_model.dart';

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  List<ReservationModel> reservations = [
    ReservationModel(id: 1, movie: movies[0], user: users[0], seats: seats),
    ReservationModel(id: 2, movie: movies[1], user: users[0], seats: seats),
    ReservationModel(id: 3, movie: movies[2], user: users[0], seats: seats),
    ReservationModel(id: 4, movie: movies[4], user: users[0], seats: seats),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
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
                color: const Color(0xff302b35),
                elevation: 10.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                          getMovieByID(reservations[index].movie.id).title,
                          style: TextStyle(
                              color: kPimaryColor,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          "Room Number: ${reservations[index].movie.screenRoom}",
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
                          " Reserved Seats: ${reservations[index].seats.length}",
                          style: TextStyle(color: kPimaryColor)),
                    ),
                  ],
                ));
          }),
    );
  }
}
