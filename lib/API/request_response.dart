import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:movie_ticket_app/user_model.dart';

class RequestAndResponses {
  static final String _baseURL = 'https://api.qasaqees.tech';
  static final String u =
      'https://hidden-springs-36426.herokuapp.com/api/test2';

  static Future<http.Response> tempp() async {
    var response = await http.get(
      Uri.parse(u),
      headers: {"Content-Type": "application/json"},
    );
    print(response.body.runtimeType);
    print(json.decode(response.body)['a']);
    return response;
  }

  static Future<http.Response> logIn(final email, final password) async {
    const String baseURL =
        'https://a1a0f024-6781-4afc-99de-c0f6fbb5d73d.mock.pstmn.io';

    var jso = {
      "email": "${email.text.toString().trim()}",
      "password": "${password.text}",
    };

    var url = '$baseURL/register/logIn';
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(jso),
    );
    print(response.body.runtimeType);
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
