import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_ticket_app/Models/movie_model.dart';
import 'package:movie_ticket_app/Models/reservation_model.dart';
import 'package:movie_ticket_app/Models/reserve_model.dart';
import 'dart:async';
import 'package:movie_ticket_app/Models/user_model.dart';
import 'package:movie_ticket_app/Provider/provider.dart';
import 'package:movie_ticket_app/const.dart';

class RequestAndResponses {
  static String _baseURL = 'https://hidden-springs-36426.herokuapp.com/api';

/////////////////////////////////////User//////////////////////////////////////////////
  static Future<int> logIn(final email, final password) async {
    var jso = {
      "userName": email,
      "password": password,
    };

    var url = '$_baseURL/user/login';
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(jso),
    );

    print("Loginnnnnnnnnnnnnnn");
    print(response.body);

    Provider.id = json.decode(response.body)['id'];

    print(Provider.id);
    print(json.decode(response.body)['id']);
    Provider.token = json.decode(response.body)['token'];
    print(Provider.token);
    Provider.currentUser = await getUserById(Provider.id!);

    return response.statusCode;
  }

  static Future<int> signUp(
    final userName,
    final firstName,
    final lastName,
    final email,
    final password,
    final role,
  ) async {
    var jso = {
      "id": 0,
      "userName": userName,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "role": role
    };

    var url = '$_baseURL/user/create';

    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(jso),
    );
    print("Signuppppppppppppppppp");

    print(response.body);

    return response.statusCode;
  }

  static Future<int> logout() async {
    var url = '$_baseURL/user/logout';

    var response = await http.post(Uri.parse(url),
        headers: {"Authorization": "Bearer ${Provider.token}"});

    print("logouttttttttttttttt");
    print(response.body);
    print(response.statusCode);
    return response.statusCode;
  }

  static Future<UserModel> getUserById(int id) async {
    print(id);
    print(Provider.token);
    var url = '$_baseURL/user/$id';

    var response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${Provider.token}'});

    print(response.statusCode);
    print(json.decode(response.body));
    print(json.decode(response.body)['user']);

    UserModel userModel =
        UserModel.fromJson(json.decode(response.body)['user']);
    print(userModel.firstName);
    print(userModel.lastName);
    print(userModel.role);
    return userModel;
  }

  static Future<int> upgradeUser(int id) async {
    var url = '$_baseURL/user/$id';

    var response = await http.put(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${Provider.token}'});
    print(response.body);
    print("updattttttttttte ${response.statusCode}");
    return response.statusCode;
  }

  static Future<int> deleteUser(int id) async {
    var url = '$_baseURL/user/$id';
    print(token);
    var response = await http.delete(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${Provider.token}'});
    print(response.body);

    print("deleteeeeeeeeeeeeee ${response.statusCode}");
    return response.statusCode;
  }

  static Future<List<UserModel>> getAllUsers() async {
    var url = '$_baseURL/user/getAllUsers';
    print("bas");
    var response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${Provider.token}'});
    print(response.body);
    List<UserModel> u =
        UserModel.listFromJson(json.decode(response.body)['users']);
    print("1----------${u[0].firstName}");
    print("2----------${u[1].firstName}");

    return u;
  }
////////////////////////////////////////Movie///////////////////////////////////////////

  static Future<int> createMovie(MovieModel movie) async {
    var jso = movie.toJson();

    var url = '$_baseURL/movie/create';

    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${Provider.token}'
      },
      body: jsonEncode(jso),
    );
    print("Creating Movie");

    print(response.body);

    return response.statusCode;
  }

  static Future<int> editMovie(MovieModel movie) async {
    var jso = movie.toJson();
    print(jso);
    var url = '$_baseURL/movie/update';

    var response = await http.put(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${Provider.token}'
      },
      body: jsonEncode(jso),
    );
    print("Editing Movie");

    print(response.body);

    return response.statusCode;
  }

  static Future<MovieModel> getMovieId(int id) async {
    print(id);
    print(Provider.token);
    var url = '$_baseURL/movie/findMovieByID?id=$id';

    var response = await http.get(Uri.parse(url));

    print(response.statusCode);
    print(response.body);

    print("Getting Movie");

    MovieModel movie = MovieModel.fromJson(json.decode(response.body));

    return movie;
  }

  static Future<List<MovieModel>> getAllMovies() async {
    var url = '$_baseURL/movie/viewAllMovies';

    var response = await http.get(Uri.parse(url));

    print(response.body);
    print("Getting Movies");

    List<MovieModel> m =
        MovieModel.listFromJson(json.decode(response.body)['movies']);

    return m;
  }

  static Future<List<int>> getAllReservedSeats(int id) async {
    var url = '$_baseURL/movie/$id/getAllReservedSeats';

    var response = await http.get(Uri.parse(url));

    print(response.body);
    print("Getting Rseats");

    List<int> s = (json.decode(response.body)['seats'] as List)
        .map((item) => item as int)
        .toList();

    return s;
  }

  static Future<int> reserveSeats(int id, ReserveModel reserveModel) async {
    var jso = reserveModel.toJson();

    var url = '$_baseURL/movie/$id/reserveVacantSeats';

    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${Provider.token}'
      },
      body: jsonEncode(jso),
    );
    print("Reserving Seats");

    print(response.body);

    return response.statusCode;
  }

  ////////////////////////////Reservations/////////////////////////////////
  static Future<int> deleteReservation(int id) async {
    var url = '$_baseURL/reservation/cancel/$id';

    print(token);
    var response = await http.delete(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${Provider.token}'});
    print(response.body);

    print("deleteeeeeeeeeeeeee ${response.statusCode}");
    return response.statusCode;
  }

  static Future<List<ReservationModel>> getAllReservations(int id) async {
    var url = '$_baseURL/reservation/viewAllReservations';

    print(token);
    var response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${Provider.token}'});
    print(response.body);
    List<ReservationModel> r = ReservationModel.listFromJson(
        json.decode(response.body)['reservations']);

    print("reservations ${response.statusCode}");
    return r;
  }
}
