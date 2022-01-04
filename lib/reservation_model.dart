class ReservationModel {
  int id;

  int movieId;

  int userId;

  int seatCount;

  int roomNumber;

  ReservationModel(
      {required this.id,
      required this.movieId,
      required this.userId,
      required this.seatCount,
      required this.roomNumber});

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
        id: json['id'],
        movieId: json['movie']['id'],
        userId: json['user']['id'],
        seatCount: json['seat']['id'],
        roomNumber: json['seat']['room']['roomNumber']);
  }
}
