/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService{
  Firestore _firestore = Firestore.instance;

  void createCategory(String name){
    var id = Uuid();
    String categoryId = id.v1();

    _firestore.collection('products').document(categoryId).setData({'products': name});
  }
}

 */

