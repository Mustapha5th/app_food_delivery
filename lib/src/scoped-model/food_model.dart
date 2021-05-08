import 'dart:convert';
import 'package:app_food_delivery/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];
  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  List<Food> get foods {
    return List.from(_foods);
  }

  int get foodLength {
    return _foods.length;
  }

  Future<bool> addFood(Food food) async {
    // _foods.add(food);
    _isLoading = true;
    notifyListeners();
    try {
      final Map<String, dynamic> foodData = {
        "title": food.name,
        "description": food.description,
        "category": food.category,
        "price": food.price,
        "discount": food.discount,
      };
      final http.Response response = await http.post(
          "https://app-food-delivery-a2bb9.firebaseio.com/foods.json",
          body: json.encode(foodData));
      final Map<String, dynamic> responseData = json.decode(response.body);
      // print(responseData["name"]);

      Food foodWithID = Food(
        id: responseData["name"],
        name: food.name,
        description: food.description,
        category: food.category,
        discount: food.discount,
        price: food.price,
      );
      _foods.add(foodWithID);

      _isLoading = false;
      notifyListeners();
      fetchFoods();
      return Future.value(true);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
      // print("Connection error: $e");
    }
  }

  Future<bool> fetchFoods() async {
    _isLoading = true;
    notifyListeners();
    try {
      final http.Response response = await http
          .get("https://app-food-delivery-a2bb9.firebaseio.com/foods.json");

      final Map<String, dynamic> fetchedData = jsonDecode(response.body);

      final List<Food> foodItems = [];
      fetchedData.forEach((String id, dynamic foodData) {
        Food foodItem = Food(
          id: id,
          name: foodData["title"],
          description: foodData["description"],
          category: foodData["category"],
          price: double.parse(foodData["price"].toString()),
          discount: double.parse(foodData["discount"].toString()),
        );

        foodItems.add(foodItem);
      });
      _foods = foodItems;
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      print("error: $error");
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> updateFood(Map<String, dynamic> foodData, String foodId) async {
    _isLoading = true;
    notifyListeners();
    // get the food id
    Food theFood = getFoodItemById(foodId);
    // get index of the food
    int foodIndex = _foods.indexOf(theFood);
    try {
      http.put(
          "https://app-food-delivery-a2bb9.firebaseio.com/foods/${foodId}.json",
          body: json.encode(foodData));
      Food updatedFoodItem = Food(
        id: foodId,
        name: foodData["title"],
        category: foodData["category"],
        price: foodData["price"],
        discount: foodData["discount"],
        description: foodData["description"],
      );
      _foods[foodIndex] = updatedFoodItem;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> deleteFood(String foodId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final http.Response response = await http.delete(
          "https://app-food-delivery-a2bb9.firebaseio.com/foods/${foodId}.json");
      
      // delete item from the list
      _foods.removeWhere((Food food) => food.id == foodId);
      
      _isLoading = false;
      notifyListeners();
      return Future.value(true);

    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Food getFoodItemById(String foodId) {
    Food food;
    for (int i = 0; i < _foods.length; i++) {
      if (_foods[i].id == foodId) {
        food = _foods[i];
        break;
      }
    }
  }
}
