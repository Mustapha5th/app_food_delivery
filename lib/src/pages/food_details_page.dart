import 'package:app_food_delivery/src/models/food_model.dart';
import 'package:app_food_delivery/src/models/user_model.dart';
import 'package:app_food_delivery/src/services/authentication_services.dart';
import 'package:app_food_delivery/src/widgets/big_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatelessWidget {
  final Food food;
  FoodDetailsPage({this.food,});
  var _mediumSpace = SizedBox(
    height: 20.0,
  );
  var _smallSpace = SizedBox(
    height: 10.0,
  );
  var _largeSpace = SizedBox(
    height: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              "Food Details",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/lunch.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
                _mediumSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      food.name,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    Text(
                      "\u{20A6} ${food.price}",
                      style: TextStyle(
                          fontSize: 16.0, color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                _mediumSpace,
                Text(
                  "Description:",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                _smallSpace,
                Text(
                  "${food.description}",
                  textAlign: TextAlign.justify,
                ),
                _mediumSpace,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  IconButton(icon: Icon(Icons.remove_circle), onPressed: null),
                  SizedBox(width: 15.0),
                  Text("1", style: TextStyle(fontSize: 16.0)),
                  SizedBox(width: 15.0),
                  IconButton(icon: Icon(Icons.add_circle), onPressed: null),
                ]),
                _largeSpace,
                BigButton(btnText:"Add to cart"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
