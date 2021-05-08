import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  // collection refrence
  final CollectionReference foodCollection = Firestore.instance.collection('foods');
  final CollectionReference customerCollection = Firestore.instance.collection('customer');
  
  Future updateUserData({String id,String imagePath,String name,String category, String description, double price, double discount, double rating}) async{
    return await foodCollection.document(uid).setData({
      'id': id,
      'name': name,
      'imagePath' : imagePath,
      'description': description,
      'category' : category,
      'price' : price,
      'discount': discount,
      'rating': rating,

    });
  }
}
