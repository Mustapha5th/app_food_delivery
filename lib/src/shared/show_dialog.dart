import 'package:app_food_delivery/src/models/user_model.dart';
import 'package:app_food_delivery/src/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ShowLoadingIndicator extends StatelessWidget{
  @override 
  Widget build(BuildContext context){

    return StreamProvider<User>.value(
            value: AuthenticationService().user,
      child:Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(child: SpinKitChasingDots(
            color: Colors.orange,
            size: 50.0,
          ),
          ),
        ),
      ),
    );
  }
}