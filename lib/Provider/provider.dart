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
  static ReservationModel? userReservations =
      ReservationModel(id: 0, movie: movies[0], seats: []);
  static String token = '';
  static int? id;
  static List<UserModel> users = [];
  static bool isGuest = false;
  static List<int> seats = [];
  static ReserveModel reserveModel =
      ReserveModel(cardNum: '', pinNum: '', seats: []);
  static List<ReservationModel> reservations = [];
  static int? currentMovieId;
  static int roomNo = 0;
}
