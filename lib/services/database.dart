import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData( String name, String address, String id, String phoneNo, String category, String email) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'address' : address,
      'id' : id,
      'phoneNo' : phoneNo,
      'category' : category,
      'email' : email,


    });
  }

}