import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String btnText;
  BigButton({this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(25.0)),
      child: Center(
          child: Text(btnText,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
                  ),
                  ),
    );
  }
}
