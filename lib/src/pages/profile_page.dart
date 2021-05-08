import 'package:app_food_delivery/src/models/user_model.dart';
import 'package:app_food_delivery/src/services/authentication_services.dart';
import 'package:app_food_delivery/src/widgets/custom_list_tile.dart';
import 'package:app_food_delivery/src/widgets/small_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthenticationService _firebaseAuth = AuthenticationService();

  bool turnOnNotification = false;
  bool turnOnLocationTracking = false;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(60.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3.0,
                              offset: Offset(0, 4.0),
                              color: Colors.black38),
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/images/breakfast.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shaheeda",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "08061651401",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 20.0),
                        SmallButtton(buttonText: "Edit"),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text("Account",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                        CustomListTile(Icons.location_on, "Location"),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                        CustomListTile(Icons.visibility, "Change Password"),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                        CustomListTile(Icons.local_shipping, "Shipping"),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                        CustomListTile(Icons.payment, "Payment"),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text("Notifications",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Card(
                    elevation: 3.0,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "App Notification",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Switch(
                                value: turnOnNotification,
                                onChanged: (bool value) {
                                  setState(() {
                                    turnOnNotification = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Location Tracking",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Switch(
                                value: turnOnLocationTracking,
                                onChanged: (bool value) {
                                  setState(() {
                                    turnOnLocationTracking = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Text("Other",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Language",
                                style: TextStyle(
                                  fontSize: 16.0,
                                )),
                            Divider(
                              height: 30.0,
                              color: Colors.grey,
                            ),
                            Text(
                              "Currency",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Divider(
                              height: 30.0,
                              color: Colors.grey,
                            ),
                          ]),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Logout",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    color: Colors.red,
                    onPressed: () async {
                      dynamic result = await _firebaseAuth.signOut();
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Authenticate(),
                      //   ),
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
