import 'package:app_food_delivery/src/models/user_model.dart';
import 'package:app_food_delivery/src/screens/welcome/splash_screen.dart';
import 'package:app_food_delivery/src/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food Delivery App",
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Colors.blueAccent),
        home: StartScreen(),
      ),
    );
  }
}
