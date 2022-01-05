import 'package:movie_ticket_app/movie_model.dart';

enum Users { customer, manager, guest }

class UserModel {
  final int id;

  final String firstName;

  final String lastName;

  final String email;

  final int role;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        role: json['role']);
  }
}
