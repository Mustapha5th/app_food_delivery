import 'package:app_food_delivery/src/models/food_model.dart';
import 'package:flutter/material.dart';

class AddFoodItem extends StatefulWidget {
  final Food food;

  AddFoodItem({this.food});
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  GlobalKey<FormState> _foodItemGlobalKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();
  String title, category, description, price, discount;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
         onWillPop: (){
        Navigator.of(context).pop(false);
        return Future.value(true);
      },
              child: Scaffold(
          key: _scaffoldStateKey,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: Text(
              widget.food != null ? "Update Food Item" : "Add Food Item",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: Form(
                key: _foodItemGlobalKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15.0),
                      height: 170.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          // color:  Colors.red,
                          image: DecorationImage(
                            image: AssetImage("assets/images/noimage.png"),
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    _builTextFormField("Food Title"),
                    _builTextFormField("Category"),
                    _builTextFormField("Description", maxLine: 5),
                    _builTextFormField("Price"),
                    _builTextFormField("Discount"),
                    SizedBox(height: 50),
                    // ScopedModelDescendant(builder:
                    //     (BuildContext context, Widget child, MainModel model) {
                    //   return GestureDetector(
                    //       onTap: () {
                    //         onSubmit(model.addFood, model.updateFood);
                    //         if (model.isLoading) {
                    //           // show loading progress indicator
                    //           showLoadingIndicator(context, widget.food != null ? "Updating Food...":"Adding Food...");
                    //         } 
                    //       },
                    //       child: BlueButton(
                    //           btnText: widget.food != null
                    //               ? "Update Food"
                    //               : "Add Food"));
                    // })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit(Function addFood, Function updateFood) async {
    if (_foodItemGlobalKey.currentState.validate()) {
      _foodItemGlobalKey.currentState.save();
      if (widget.food != null) {
        // edit food item
        Map<String, dynamic> updatedFoodItem = {
          "title": title,
          "category" : category,
          "description" : description,
          "price" : double.parse(price),
          "discount": discount != null ? double.parse(discount) :0.0,

        };
      final bool response = await  updateFood(updatedFoodItem, widget.food.id);
      if(response){
        Navigator.of(context).pop(); // to remove the alert dialog
        Navigator.of(context).pop(response); // to go back to previous page
      
      }else if(!response){
         Navigator.of(context).pop();
         SnackBar snackBar = SnackBar(
          duration:  Duration(seconds: 2),
          backgroundColor: Colors.red,
            content: Text("Failed to Updated.", style: TextStyle(color: Colors.white, fontSize: 16.0, ),),
          );
           _scaffoldStateKey.currentState.showSnackBar(snackBar);
      }
      } else if (widget.food == null) {
        // add food item
        final Food food = Food(
          name: title,
          category: category,
          description: description,
          price: double.parse(price),
          discount: double.parse(discount),
        );
        bool value = await addFood(food);
        if (value) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text("Successfully Added."),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        } else if (!value) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text("Failed to Add Food"),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      }
    }
  }

  Widget _builTextFormField(String hint, {int maxLine = 1}) {
    return TextFormField(
      initialValue: widget.food != null && hint == "Food Title"
          ? widget.food.name
          : widget.food != null && hint == "Description"
              ? widget.food.description
              : widget.food != null && hint == "Category"
                  ? widget.food.category
                  : widget.food != null && hint == "Price"
                      ? widget.food.price.toString()
                      : widget.food != null && hint == "Discount"
                          ? widget.food.discount.toString()
                          : "",
      decoration: InputDecoration(hintText: "$hint"),
      maxLines: maxLine,
      keyboardType: hint == "Price" || hint == "Discount"
          ? TextInputType.number
          : TextInputType.text,
      // validator: (String value) {
      //   if (value.isEmpty && hint == "Food Title") {
      //     return "The food title is required";
      //   }
      //   if (value.isEmpty && hint == "Description") {
      //     return "The description is required";
      //   }
      //   if (value.isEmpty && hint == "Category") {
      //     return "The category is required";
      //   }
      //   if (value.isEmpty && hint == "Price") {
      //     return "The price is required";
      //   }
      // // },
      // onSaved: (String value) {
      //   if (hint == "Food Title") {
      //     title = value;
      //   }
      //   if (hint == "Category") {
      //     category = value;
      //   }
      //   if (hint == "Description") {
      //     description = value;
      //   }
      //   if (hint == "Price") {
      //     price = value;
      //   }
      //   if (hint == "Discount") {
      //     discount = value;
      //   }
      //},
    );
  }
}
