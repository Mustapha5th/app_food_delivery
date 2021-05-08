import 'package:app_food_delivery/src/models/user_model.dart';
import 'package:app_food_delivery/src/screens/authenticate/authenticate.dart';
import 'package:app_food_delivery/src/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return either home or authenticate
    if (user == null) {
      return Authenticate();
    }else{
      return HomeScreen();
    }

  }
}