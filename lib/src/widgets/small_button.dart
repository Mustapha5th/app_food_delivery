import 'package:flutter/material.dart';

class SmallButtton extends StatelessWidget {

  final String buttonText;
  SmallButtton({this.buttonText});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 60.0,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(20.0)),
      child: Center(
        child: Text(
          "$buttonText",
          style: TextStyle(color: Colors.orange, fontSize: 16.0),
        ),
      ),
    );
  }
}
