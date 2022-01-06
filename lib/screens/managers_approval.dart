import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/movie_model.dart';
import 'package:movie_ticket_app/reservation_model.dart';
import 'package:movie_ticket_app/user_model.dart';
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Admin Page", style: TextStyle(color: kPimaryColor))),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                color: Color(0xff302b35), //const Color(0xFF94ADEA),
                elevation: 10.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                          users[index].firstName + ' ' + users[index].lastName,
                          style: TextStyle(
                              color: kPimaryColor,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text("Email: ${users[index].email}",
                          style: TextStyle(
                              color: kPimaryColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(users[index].role == 0 ? 'User' : 'manager',
                          style: TextStyle(color: kPimaryColor)),
                    ),
                    ButtonBar(
                      children: [
                        TextButton(
                          child: Text(
                            'Upgrade To Manager',
                            style: TextStyle(color: Colors.green[400]),
                          ),
                          onPressed: () {
                            setState(() {
                              users[index].role = 2;
                            });
                            Alert(
                              context: context,
                              title:
                                  "${users[index].firstName} is Upgraded successfully",
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
                          },
                        ),
                        TextButton(
                          child: Text(
                            'Disapprove',
                            style: TextStyle(color: Colors.red[200]),
                          ),
                          onPressed: () {
                            setState(() {
                              // users.remove(users[index]);
                              Alert(
                                context: context,
                                title:
                                    "${users[index].firstName}'s request is disapproved successfully",
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
                              users[index].role = 0;
                            });
                          },
                        ),
                        TextButton(
                          child: Text(
                            'Delete User',
                            style: TextStyle(color: Colors.red[400]),
                          ),
                          onPressed: () {
                            Alert(
                              context: context,
                              title:
                                  "${users[index].firstName} is deleted successfully",
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
                              users.remove(users[index]);
                            });
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
