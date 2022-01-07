import 'package:movie_ticket_app/Models/movie_model.dart';
import 'package:movie_ticket_app/Models/reservation_model.dart';
import 'package:movie_ticket_app/Models/room_model.dart';
import 'package:movie_ticket_app/Models/user_model.dart';

class Provider {
  static UserModel? currentUser;
  static MovieModel? currentMovie;
  static RoomModel? currentRoom;
  static ReservationModel? userReservations;
  static String token = '';
  static int? id;
}
