class ReserveModel {
  String cardNum;

  String pinNum;

  List<int> seats;

  ReserveModel(
      {required this.cardNum, required this.pinNum, required this.seats});

  @override
  String toString() {
    return 'MovieIDReserveVacantSeatsBody[cardNum=$cardNum, pinNum=$pinNum, seats=$seats, ]';
  }

  factory ReserveModel.fromJson(Map<String, dynamic> json) {
    return ReserveModel(
      cardNum: json['cardNum'],
      pinNum: json['pinNum'],
      seats: (json['seats'] as List).map((item) => item as int).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'cardNum': cardNum, 'pinNum': pinNum, 'seats': seats};
  }

  static List<ReserveModel> listFromJson(List<dynamic> json) {
    return json.map((value) => ReserveModel.fromJson(value)).toList();
  }

  static Map<String, ReserveModel> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = Map<String, ReserveModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = ReserveModel.fromJson(value));
    }
    return map;
  }
}
