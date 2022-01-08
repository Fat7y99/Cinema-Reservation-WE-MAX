import 'package:movie_ticket_app/Models/movie_model.dart';
import 'package:movie_ticket_app/Models/reservation_model.dart';
import 'package:movie_ticket_app/Models/reserve_model.dart';
import 'package:movie_ticket_app/Models/room_model.dart';
import 'package:movie_ticket_app/Models/user_model.dart';

class Provider {
  static UserModel? currentUser;
  static MovieModel? currentMovie;
  static List<MovieModel> movies = [];
  static RoomModel? currentRoom;
  static ReservationModel? userReservations;
  static String token = '';
  static int? id;
  static List<UserModel> users = [];
  static bool isGuest = false;
  static List<int> seats = [];
  static ReserveModel? reserveModel;
  static List<ReservationModel> reservations = [];
}
