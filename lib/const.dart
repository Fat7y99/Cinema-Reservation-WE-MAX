import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/seat_data.dart';

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

List<SeatData> seats2 = [
  SeatData(id: 21),
  SeatData(id: 22),
  SeatData(id: 23),
  SeatData(id: 24),
  SeatData(id: 25),
  SeatData(id: 26),
  SeatData(id: 27),
  SeatData(id: 28),
  SeatData(id: 29),
  SeatData(id: 30),
  SeatData(id: 31),
  SeatData(id: 32),
  SeatData(id: 33),
  SeatData(id: 34),
  SeatData(id: 35),
  SeatData(id: 36),
  SeatData(id: 37),
  SeatData(id: 38),
  SeatData(id: 39),
  SeatData(id: 40),
  SeatData(id: 41),
  SeatData(id: 42),
  SeatData(id: 43),
  SeatData(id: 44),
  SeatData(id: 45),
  SeatData(id: 46),
  SeatData(id: 47),
  SeatData(id: 48),
  SeatData(id: 49),
  SeatData(id: 50),
];
