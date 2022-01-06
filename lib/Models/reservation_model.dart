import 'user_model.dart';
import 'movie_model.dart';
import 'seat_model.dart';

class ReservationModel {
  int id;

  MovieModel movie;

  UserModel user;

  SeatModel seat;

  ReservationModel({
    required this.id,
    required this.movie,
    required this.user,
    required this.seat,
  });

  @override
  String toString() {
    return 'ReservationModel[id=$id, movie=$movie, user=$user, seat=$seat, ]';
  }

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      movie: MovieModel.fromJson(json['movie']),
      user: UserModel.fromJson(json['user']),
      seat: SeatModel.fromJson(json['seat']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'movie': movie, 'user': user, 'seat': seat};
  }

  static List<ReservationModel> listFromJson(List<dynamic> json) {
    return json.map((value) => ReservationModel.fromJson(value)).toList();
  }

  static Map<String, ReservationModel> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = Map<String, ReservationModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = ReservationModel.fromJson(value));
    }
    return map;
  }
}
