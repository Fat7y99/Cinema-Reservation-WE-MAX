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

List<SeatModel> seats = [
  SeatModel(
    id: 1,
    seatNumber: 1,
    room: RoomModel(id: 0, roomNumber: 1),
  ),
  SeatModel(
    id: 1,
    seatNumber: 1,
    room: RoomModel(id: 0, roomNumber: 1),
  ),
  SeatModel(
    id: 1,
    seatNumber: 1,
    room: RoomModel(id: 0, roomNumber: 1),
  ),
  SeatModel(
    id: 1,
    seatNumber: 1,
    room: RoomModel(id: 0, roomNumber: 1),
  ),
  SeatModel(
    id: 1,
    seatNumber: 1,
    room: RoomModel(id: 0, roomNumber: 1),
  ),
];
