import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:movie_ticket_app/Models/user_model.dart';

class RequestAndResponses {
  static final String _baseURL =
      'http://hidden-springs-36426.herokuapp.com/api';

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
      "email": "${email.text.trim()}",
      "password": "${password.text}",
    };

    var url = '$_baseURL/register/logIn';
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(jso),
    );
    print(jsonEncode(response.body));

    UserModel user = UserModel.fromJson(json.decode(response.body));
    print("hi");
    print(user.firstName);
    print(user.email);
    print(user.id);
    print(user.lastName);
    print(user.role);

    return response;
  }
}
