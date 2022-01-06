import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/seat_component.dart';

class SeatData {
  bool isReserved;
  int id;
  bool isSelected;

  SeatData({
    required this.id,
    this.isSelected = false,
    this.isReserved = false,
  });
}

class Seats extends StatelessWidget {
  List<SeatData> seats;
  List<int> seatsIndex;
  Function reserveCallBack;
  Seats({
    Key? key,
    required this.seats,
    required this.seatsIndex,
    required this.reserveCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int seatsNo = seats.length;
    List<Widget> mySeats = [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return SeatComponent(
                  id: seats[index].id,
                  isReserved: seats[index].isReserved,
                  isSelected: seats[index].isSelected,
                  reserve: reserveCallBack,
                );
              },
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 20) * 2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return SeatComponent(
                  id: seats[index + 5].id,
                  isReserved: seats[index + 5].isReserved,
                  isSelected: seats[index + 5].isSelected,
                  reserve: reserveCallBack,
                );
              },
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return SeatComponent(
                  id: seats[index + 10].id,
                  isReserved: seats[index + 10].isReserved,
                  isSelected: seats[index + 10].isSelected,
                  reserve: reserveCallBack,
                );
              },
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 20) * 2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return SeatComponent(
                  id: seats[index + 15].id,
                  isReserved: seats[index + 15].isReserved,
                  isSelected: seats[index + 15].isSelected,
                  reserve: reserveCallBack,
                );
              },
            ),
          ),
        ],
      ),
    ];
    if (seatsNo == 30) {
      mySeats.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return SeatComponent(
                    id: seats[index + 20].id,
                    isReserved: seats[index + 20].isReserved,
                    isSelected: seats[index + 20].isSelected,
                    reserve: reserveCallBack,
                  );
                },
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width / 20) * 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return SeatComponent(
                    id: seats[index + 25].id,
                    isReserved: seats[index + 25].isReserved,
                    isSelected: seats[index + 25].isSelected,
                    reserve: reserveCallBack,
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: mySeats,
      ),
    );
  }
}
