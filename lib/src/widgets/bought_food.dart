import 'package:flutter/material.dart';

class BoughtFood extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double rating;

  BoughtFood(
      {this.id,
      this.name,
      this.imagePath,
      this.category,
      this.discount,
      this.price,
      this.rating});
  @override
  _BoughtFoodState createState() => _BoughtFoodState();
}

class _BoughtFoodState extends State<BoughtFood> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            width: 370.0,
            child: Image.asset(
            widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: Container(
                height: 60.0,
                width: 370.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.black, Colors.black12],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ))),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Theme.of(context).primaryColor,
                        size: 16.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Theme.of(context).primaryColor,
                        size: 16.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Theme.of(context).primaryColor,
                        size: 16.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Theme.of(context).primaryColor,
                        size: 16.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Theme.of(context).primaryColor,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "("+widget.rating.toString() + " Reviews)",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ]),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      widget.price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "Min order",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
