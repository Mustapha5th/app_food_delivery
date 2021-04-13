import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {

      Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(children: [
          Container(
            child: Image(
              image: AssetImage("assets/images/delivery_screen.png"),
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Welcome to',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "FooDli",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
         
          ),
          Text('Your favorite Food Delivered at your Doorstep', style: TextStyle(color: Colors.black),),
        ]),
      ),
    );
  }
}
