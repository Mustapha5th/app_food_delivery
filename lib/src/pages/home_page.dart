import 'package:app_food_delivery/src/models/user_model.dart';
import 'package:app_food_delivery/src/services/authentication_services.dart';
import 'package:app_food_delivery/src/widgets/food_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/home_top_info.dart';
import '../widgets/search_field.dart';

// models

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // widget.foodModel.fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          children: <Widget>[ 
            HomeTopInfo(),
            FoodCategory(),
            SizedBox(
              height: 20.0,
            ),
            SearchField(),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Frequently bought foods",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text("View All",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent)),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // ScopedModelDescendant<MainModel>(
            //     builder: (BuildContext context, Widget child, MainModel model) {
            //   return Column(
            //     children: model.foods.map(_buildFoodItems).toList(),
            //   );
            // }),
          ],
        ),
      ),
    );
  }

  // Widget _buildFoodItems(Food food) {
  //   return GestureDetector(
  //     onTap: (){
  //       Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FoodDetailsPage(food: food,),));
  //     },
  //         child: Container(
  //       margin: EdgeInsets.only(bottom: 20.0),
  //       child: BoughtFood(
  //         id: food.id,
  //         name: food.name,
  //         imagePath: "assets/images/lunch.jpeg",
  //         category: food.category,
  //         discount: food.discount,
  //         price: food.price,
  //         rating: food.rating,
  //       ),
  //     ),
  //   );
  // }
}
