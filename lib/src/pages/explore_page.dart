import 'package:app_food_delivery/src/models/user_model.dart';
import 'package:app_food_delivery/src/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // the scaffold global key
  GlobalKey<ScaffoldState> _explorePageScaffoldKey;
  @override
  void initState() {
    //TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: Scaffold(
        key: _explorePageScaffoldKey,
        backgroundColor: Colors.white,
        // body: ScopedModelDescendant<MainModel>(
        //     builder: (BuildContext sctx, Widget child, MainModel model) {
        //   //model.fetchFoods(); // this will fetch and notifyListeners()
        //   // List<Food> foods = model.foods;
        //   return Container(
        //     padding: EdgeInsets.symmetric(horizontal: 20.0),
        //     child: RefreshIndicator(
        //       onRefresh: model.fetchFoods,
        //       child: ListView.builder(
        //         itemCount: model.foodLength,
        //         itemBuilder: (BuildContext lctx, int index) {
        //           return GestureDetector(
        //             onTap: () async {
        //               final bool response = await Navigator.of(context).push(
        //                 MaterialPageRoute(
        //                     builder: (BuildContext sctx) => AddFoodItem(
        //                           food: model.foods[index],
        //                         )),
        //               );
        //               if (response) {
        //                 SnackBar snackBar = SnackBar(
        //                   duration: Duration(seconds: 2),
        //                   backgroundColor: Theme.of(context).primaryColor,
        //                   content: Text(
        //                     "Successfully Updated.",
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 16.0,
        //                     ),
        //                   ),
        //                 );
        //                 _explorePageScaffoldKey.currentState
        //                     .showSnackBar(snackBar);
        //               }
                      
                      
        //             },
        //             onDoubleTap: (){
        //               // delete food item
        //               showLoadingIndicator(context, "Deleting food item...");
        //               model.deleteFood(model.foods[index].id).then((bool response){
        //                 Navigator.of(context).pop();
        //               });

        //             },
        //             // child: FoodItemCard(
        //             //   model.foods[index].name,
        //             //   model.foods[index].description,
        //             //   model.foods[index].price.toString(),
        //             // ),
        //           );
        //         },
        //       ),
        //     ),
        //   );
        // }),
      ),
    );
  }
}

//  Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.0,),
//         child:
//       ),
