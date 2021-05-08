import 'package:app_food_delivery/src/widgets/small_button.dart';
import 'package:flutter/material.dart';
class FoodItemCard extends StatelessWidget{
  final String title, description, price;

FoodItemCard(this.title,this.description,this.price);
  @override
  Widget build(BuildContext context) {
   return        Container(
            width: MediaQuery.of(context).size.width,
            height: 120.0,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(0, 3),
                    color: Colors.black12,
                  )
                ],
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: AssetImage("assets/images/breakfast.jpeg"),
                        fit: BoxFit.cover),
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$title",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                       
                          child: Text(
                              "$description")),
                      SizedBox(height: 10.0),
                      Container(
                        width: 220.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\u{20A6} $price",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SmallButtton(buttonText: "Buy")
                          ],
                        ),
                      ),
                    ])
              ],
            ),
          );
       
  }


}