import 'package:app_food_delivery/src/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
 Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Wrapper(),
          ),
        );
      },
    );
      Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: double.infinity,
          child: Column(children: [
           SizedBox(height: 20.0,),
            Container(
              child: Image(
                image: AssetImage("assets/images/delivery_screen.png"),
              ),
            ),
            SizedBox(height: 10.0,),
           
            RichText(
              text: TextSpan(
                text: 'Welcome to ',
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
              SizedBox(height: 10.0,),
            Text('Your favorite Food Delivered at your Doorstep', style: TextStyle(color: Colors.black),
            ),
             SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SpinKitThreeBounce(color: Colors.orange,size: 50.0, duration: Duration(seconds: 3),),
              ],
            ),
          ]),
          
        ),
        
      ),
    );
  }
}
