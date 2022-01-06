import 'package:movie_ticket_app/Models/movie_model.dart';

enum Users { customer, manager, guest }

class UserModel {
  int id;

  String userName;

  String firstName;

  String lastName;

  String email;

  String password;

  int role;

  UserModel({
    required this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    this.password = '',
  });

  @override
  String toString() {
    return 'UserModel[id=$id, UserModelName=$userName, firstName=$firstName, lastName=$lastName, email=$email, password=$password, role=$role, ]';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'UserModelName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'role': role
    };
  }

  static List<UserModel> listFromJson(List<dynamic> json) {
    return json.map((value) => UserModel.fromJson(value)).toList();
  }

  static Map<String, UserModel> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = Map<String, UserModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = UserModel.fromJson(value));
    }
    return map;
  }
}

List<UserModel> users = [
  UserModel(
      id: 1,
      userName: 'Fatoo7',
      firstName: 'Fathy0',
      lastName: 'Nabil0',
      email: 'Fathy.nabil2022@gmail.com',
      role: 1),
  UserModel(
      id: 2,
      userName: 'Fatoo71',
      firstName: 'Fathy1',
      lastName: 'Nabil1',
      email: 'Fathy.nabil2022@gmail.com',
      role: 1),
  UserModel(
      id: 3,
      userName: 'Fatoo72',
      firstName: 'Fathy2',
      lastName: 'Nabil2',
      email: 'Fathy.nabil2022@gmail.com',
      role: 0),
  UserModel(
      id: 4,
      userName: 'Fatoo73',
      firstName: 'Fathy3',
      lastName: 'Nabil3',
      email: 'Fathy.nabil2022@gmail.com',
      role: 1),
];
