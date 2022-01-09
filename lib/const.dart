import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/seat_data.dart';
import 'components/seat_data2.dart';

const kPimaryColor = Color(0xffF7BB0E);

const kActionColor = Color(0xffF00000);
var token = '';
const kBackgroundColor = Color(0xff29282C);
const kMovieNameStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
final kMainTextStyle = GoogleFonts.barlow(
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold));
final kSmallMainTextStyle = kMainTextStyle.copyWith(fontSize: 16.0);

final kPromaryColorTextStyle = const TextStyle(
    color: kPimaryColor, fontSize: 18.0, fontWeight: FontWeight.bold);

final BoxDecoration kRoundedFadedBorder = BoxDecoration(
    border: Border.all(color: Colors.white54, width: .5),
    borderRadius: BorderRadius.circular(15.0));

final ThemeData theme =
    ThemeData.dark().copyWith(textTheme: GoogleFonts.barlowTextTheme());

List<SeatData> seats = [
  SeatData(id: 1),
  SeatData(id: 2),
  SeatData(id: 3),
  SeatData(id: 4),
  SeatData(id: 5),
  SeatData(id: 6),
  SeatData(id: 7),
  SeatData(id: 8),
  SeatData(id: 9),
  SeatData(id: 10),
  SeatData(id: 11),
  SeatData(id: 12),
  SeatData(id: 13),
  SeatData(id: 14),
  SeatData(id: 15),
  SeatData(id: 16),
  SeatData(id: 17),
  SeatData(id: 18),
  SeatData(id: 19),
  SeatData(id: 20),
];

List<SeatData2> seats2 = [
  SeatData2(id: 21),
  SeatData2(id: 22),
  SeatData2(id: 23),
  SeatData2(id: 24),
  SeatData2(id: 25),
  SeatData2(id: 26),
  SeatData2(id: 27),
  SeatData2(id: 28),
  SeatData2(id: 29),
  SeatData2(id: 30),
  SeatData2(id: 31),
  SeatData2(id: 32),
  SeatData2(id: 33),
  SeatData2(id: 34),
  SeatData2(id: 35),
  SeatData2(id: 36),
  SeatData2(id: 37),
  SeatData2(id: 38),
  SeatData2(id: 39),
  SeatData2(id: 40),
  SeatData2(id: 41),
  SeatData2(id: 42),
  SeatData2(id: 43),
  SeatData2(id: 44),
  SeatData2(id: 45),
  SeatData2(id: 46),
  SeatData2(id: 47),
  SeatData2(id: 48),
  SeatData2(id: 49),
  SeatData2(id: 50),
];
