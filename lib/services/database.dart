import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plantationtransaction/models/seller.dart';
import 'package:plantationtransaction/models/product.dart';
import 'package:uuid/uuid.dart';


class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference customerCollection = Firestore.instance.collection('customers');
  final CollectionReference sellerCollection = Firestore.instance.collection('sellers');
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

}