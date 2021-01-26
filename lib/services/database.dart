import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plantationtransaction/models/seller.dart';
import 'package:plantationtransaction/models/product.dart';
import 'package:plantationtransaction/models/user.dart';
import 'package:uuid/uuid.dart';
import'package:firebase_auth/firebase_auth.dart';
import 'package:plantationtransaction/screens/seller_pro/seller_pro_add_product.dart';


import 'package:flutter/cupertino.dart';



class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');
  final  CollectionReference productCollection = Firestore.instance.collection('products');

// upload users data to the firebase
  Future updateUserData( String name, String address, String nic, String phoneNo,String category, String email ) async {
    return await userCollection.document(uid).setData({
      'userid' : uid,
      'name': name,
      'address' : address,
      'NIC': nic,
      'phoneNo' : phoneNo,
      'category' : category,
      'email' : email,


    });
  }

  // get seller Stream
  Stream<List<User>> get sellers {
    return userCollection.where('category', isEqualTo: 'seller').snapshots().map(_sellerListFromSnapshot);
  }

  //seller list from snapshot
  List<User> _sellerListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return User(
        name: doc.data['name'] ?? 'shopName',
        address: doc.data['address'] ?? 'address',
        uid: doc.data['userid'] ?? 'id',
      );
    }).toList();
  }


// send data to product collection
  Future updateProductData(String pName,String pCategory, String pQuantity, String pPrice, String pDiscription, String image)async{
    Future getCurrentUser() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseUser user = await _auth.currentUser();
      final uid = user.uid;
      print(uid);
      return uid.toString();
    }
    //var id = Uuid();
    //String productId = id.v1();
    String userid = await getCurrentUser();
    return await productCollection.document().setData({
      //'pid':productId,
      'productName':pName,
      'productCategory':pCategory,
      'productQuantity':pQuantity,
      'productPrice':pPrice,
      'pDiscription': pDiscription,
      'seller id':userid,
      'images': image,

    });

  }
  //2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
  //3333333333333333333333333333333333333333333333333
  // get product Stream
Stream<List<Product>> products(String sid){
    return productCollection.where('seller id', isEqualTo: sid).snapshots().map(_productListFromSnapshot);
}
List<Product>_productListFromSnapshot(QuerySnapshot snapshot){
  return snapshot.documents.map((doc){
    return Product(
      pName: doc.data['productName'] ?? 'productName',
      pPrice: doc.data['productPrice'] ?? 'price',
      pQuantity: doc.data['productQuantity'] ?? 'Quantity',
      pDiscription: doc.data['pDiscription'] ?? 'Discription',
      pCategory: doc.data['productCategory'] ?? 'Category',
      imageList: doc.data['images'] ?? 'Images',


    );
  }).toList();
}


//33333333333333333333333333333333333333333333333333

  // get product Stream
  /*Future<Stream<List<Product>>> get products async {
    Future getCurrentUser() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseUser user = await _auth.currentUser();
      final uid = user.uid;
      print(uid);
      return uid.toString();
    }
    String userid = await getCurrentUser();
    return productCollection.where('seller id', isEqualTo:userid ).snapshots().map(_productListFromSnapshot);
  }

  //product list from snapshot
  List<Product> _productListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Product(
        pName: doc.data['name'] ?? 'productName',
        pPrice: doc.data['address'] ?? 'price',
        pQuantity: doc.data['address'] ?? 'Quantity',

      );
    }).toList();
  }*/

//2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222


}























//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================
/*class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference customerCollection = Firestore.instance.collection('customers');
  final CollectionReference sellerCollection = Firestore.instance.collection('sellers');
  //final CollectionReference userCollection = Firestore.instance.collection('users');
  final  CollectionReference productCollection = Firestore.instance.collection('products');

  // send data to customer collection
 Future updateCustomerData( String name, String address, String phoneNo, String email, String customerNIC) async {
    return await customerCollection.document(uid).setData({
      'name': name,
      'address' : address,
      'customerId' : uid,
      'phoneNo' : phoneNo,
      'NIC': customerNIC,
      'email' : email,


    });
  }

  // send data to seller collection
  Future updateSellerData( String name, String address, String phoneNo, String email,  String sellerNIC) async {
    return await sellerCollection.document(uid).setData({
      'name': name,
      'address' : address,
      'sellerid' : uid,
      'phoneNo' : phoneNo,
      'NIC': sellerNIC,
      'email' : email,


    });
  }
  /*Future updateUserData( String name, String address, String phoneNo,String category, String email,  String sellerNIC) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'address' : address,
      'sellerid' : uid,
      'phoneNo' : phoneNo,
      'category' : category,
      'NIC': sellerNIC,
      'email' : email,


    });
  }*/


  //seller list from snapshot
  List<Seller> _sellerListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Seller(
        name: doc.data['name'] ?? 'shopName',
        address: doc.data['address'] ?? 'address',


      );
    }).toList();
  }

  // get seller Stream
Stream<List<Seller>> get sellers {
    return sellerCollection.snapshots()
      .map(_sellerListFromSnapshot);

}
// send data to product collection
Future updateProductData(String pName,String pCategory, String pQuantity, String pPrice, String pDiscription)async{
    var id = Uuid();
    String productId = id.v1();
    return await productCollection.document(productId).setData({
      'pid':productId,
      'productName':pName,
      'productCategory':pCategory,
      'productQuantity':pQuantity,
      'productPrice':pPrice,
      'pDiscription': pDiscription,
      'seller id':uid,
    });
}

}*/