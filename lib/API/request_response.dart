import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:movie_ticket_app/Models/user_model.dart';
import 'package:movie_ticket_app/Provider/provider.dart';
import 'package:movie_ticket_app/const.dart';

class RequestAndResponses {
  static String _baseURL = 'https://hidden-springs-36426.herokuapp.com/api';

/////////////////////////////////////User//////////////////////////////////////////////
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

    print("Loginnnnnnnnnnnnnnn");
    print(response.body);

    Provider.id = json.decode(response.body)['id'];

    print(Provider.id);
    print(json.decode(response.body)['id']);
    Provider.token = json.decode(response.body)['token'];
    print(Provider.token);
    Provider.currentUser = await getUserById(Provider.id!);

    return response;
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
    print("updattttttttttte ${response.statusCode}");
    return response.statusCode;
  }

  static Future<int> deleteUser(int id) async {
    var url = '$_baseURL/user/$id';
    print(token);
    var response = await http.delete(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${Provider.token}'});
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

}
