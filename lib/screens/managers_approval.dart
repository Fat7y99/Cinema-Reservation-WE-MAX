import 'package:flutter/material.dart';
import 'package:movie_ticket_app/API/request_response.dart';
import 'package:movie_ticket_app/Provider/provider.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/Models/movie_model.dart';
import 'package:movie_ticket_app/Models/reservation_model.dart';
import 'package:movie_ticket_app/Models/user_model.dart';
import 'package:movie_ticket_app/screens/LoginScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ManagerApproval extends StatefulWidget {
  @override
  _ManagerApprovalState createState() => _ManagerApprovalState();
}

class _ManagerApprovalState extends State<ManagerApproval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Admin Page", style: TextStyle(color: kPimaryColor)),
        actions: [
          IconButton(
              onPressed: () async {
                await RequestAndResponses.logout();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginPage(), //should take movies[widget.index].id
                  ),
                );
              },
              icon: Icon(
                Icons.logout,
                color: kPimaryColor,
              )),
        ],
      ),
      body: ListView.builder(
          itemCount: Provider.users.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                color: Color(0xff302b35), //const Color(0xFF94ADEA),
                elevation: 10.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                          Provider.users[index].firstName +
                              ' ' +
                              Provider.users[index].lastName,
                          style: TextStyle(
                              color: kPimaryColor,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text("Email: ${Provider.users[index].email}",
                          style: TextStyle(
                              color: kPimaryColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(Provider.users[index].role,
                          style: TextStyle(color: kPimaryColor)),
                    ),
                    ButtonBar(
                      children: [
                        TextButton(
                            child: Text(
                              'Upgrade To Manager',
                              style: TextStyle(color: Colors.green[400]),
                            ),
                            onPressed: () async {
                              int upg = await RequestAndResponses.upgradeUser(
                                  Provider.users[index].id);
                              if (upg == 200) {
                                Provider.users =
                                    await RequestAndResponses.getAllUsers();
                                setState(() {
                                  Provider.users[index].role = 'manager';
                                  //   Provider.users[index].role =
                                  //       'manager'; //TODO UPDATE USER
                                });
                                Alert(
                                  context: context,
                                  title:
                                      "${Provider.users[index].firstName} is Upgraded successfully",
                                  // desc: "Flutter is better with RFlutter Alert.",
                                  image: Image.asset(
                                    "assets/images/success.png",
                                    scale: 10,
                                  ),

                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      color: kBackgroundColor,
                                      radius: BorderRadius.circular(0.0),
                                    ),
                                  ],
                                ).show();
                              }
                            }),
                        TextButton(
                          child: Text(
                            'Delete User',
                            style: TextStyle(color: Colors.red[400]),
                          ),
                          onPressed: () async {
                            int statusCode =
                                await RequestAndResponses.deleteUser(
                                    Provider.users[index].id);
                            if (statusCode == 200) {
                              Alert(
                                context: context,
                                title:
                                    "${Provider.users[index].firstName} is deleted successfully",
                                // desc: "Flutter is better with RFlutter Alert.",
                                image: Image.asset(
                                  "assets/images/success.png",
                                  scale: 10,
                                ),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Ok",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: kBackgroundColor,
                                    radius: BorderRadius.circular(0.0),
                                  ),
                                ],
                              ).show();
                              setState(() {
                                Provider.users.remove(Provider.users[index]);
                                print(Provider.users); //TODO Delete user req
                              });
                              Provider.users =
                                  await RequestAndResponses.getAllUsers();
                            } else {
                              print("NOOOO");
                            }
                          },
                        ),
                      ],
                    )
                  ],
                ));
          }),
    );
  }
}
