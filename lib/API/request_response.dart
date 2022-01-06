import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:movie_ticket_app/Models/user_model.dart';

class RequestAndResponses {
  static String _baseURL = 'http://hidden-springs-36426.herokuapp.com/api';

  // static Future<http.Response> tempp() async {
  //   var response = await http.get(
  //     Uri.parse(_baseURL),
  //     headers: {"Content-Type": "application/json"},
  //   );
  //   print(response.body.runtimeType);
  //   print(json.decode(response.body)['a']);
  //   return response;
  // }

  static Future<http.Response> logIn(final email, final password) async {
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
    print(jsonEncode(response.body));

    print(json.decode(response.body)['token']);
    // UserModel user = UserModel.fromJson(json.decode(response.body));

    // print("hi");
    // print(user.firstName);
    // print(user.email);
    // print(user.id);
    // print(user.lastName);
    // print(user.role);

    return response;
  }

  static Future<int> signUp(
    final userName,
    final firstName,
    final lastName,
    final email,
    final password,
    int role,
  ) async {
    var jso = {
      "id": 0,
      "userName": userName,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "role": 0
    };

    var url = '$_baseURL/user/create';

    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(jso),
    );

    print(response.body);

    return response.statusCode;
  }
}

// UserModel user = UserModel.fromJson(json.decode(response.body));
//
// print("hi");
// print(user.firstName);
// print(user.email);
// print(user.id);
// print(user.lastName);
// print(user.role);
