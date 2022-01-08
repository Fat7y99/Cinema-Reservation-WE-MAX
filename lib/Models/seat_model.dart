import 'room_model.dart';

class SeatModel {
  int id;

  int seatNumber;

  RoomModel room;

  SeatModel({required this.id, required this.seatNumber, required this.room});

  @override
  String toString() {
    return 'SeatModel[id=$id, seatNumber=$seatNumber, room=$room, ]';
  }

  factory SeatModel.fromJson(Map<String, dynamic> json) {
    return SeatModel(
      id: json['id'],
      seatNumber: json['seatNumber'],
      room: RoomModel.fromJson(json['room']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'seatNumber': seatNumber, 'room': room};
  }

  static List<SeatModel> listFromJson(List<dynamic> json) {
    return json.map((value) => SeatModel.fromJson(value)).toList();
  }

  static Map<String, SeatModel> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = Map<String, SeatModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = SeatModel.fromJson(value));
    }
    return map;
  }
}

List<int> seats = [1, 2, 3, 4, 5, 6, 7, 8, 9];
