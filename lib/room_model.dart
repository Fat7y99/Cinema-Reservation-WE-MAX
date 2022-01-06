class RoomModel {
  int id;

  int roomNumber;

  RoomModel({required this.id, required this.roomNumber});

  @override
  String toString() {
    return 'RoomModel[id=$id, roomNumber=$roomNumber, ]';
  }

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['id'],
      roomNumber: json['roomNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'roomNumber': roomNumber};
  }

  static List<RoomModel> listFromJson(List<dynamic> json) {
    return json.map((value) => RoomModel.fromJson(value)).toList();
  }

  static Map<String, RoomModel> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = Map<String, RoomModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = RoomModel.fromJson(value));
    }
    return map;
  }
}
