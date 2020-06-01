import'package:firebase_auth/firebase_auth.dart';
import 'package:plantationtransaction/models/user.dart';
import 'package:plantationtransaction/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

    // sign in  anon
    Future signInAnon() async{
      try{
        AuthResult result = await _auth.signInAnonymously();
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);


      }catch(e){
        print(e.toString());
        return null;
      }
    }


    //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


    //sign up with email and password

  Future signUpWithEmailAndPassword( String name, String address, String nic, String phoneNo, String category,String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //create a new document with the uid
      //await DatabaseService(uid: user.uid).updateUserData(name, address, id , phoneNo , category , email);
      if(category=='customer'){
        await DatabaseService(uid: user.uid).updateCustomerData(name, address, phoneNo, email, nic);
    }else{
        await DatabaseService(uid: user.uid).updateSellerData(name, address, phoneNo, email, nic);
    }
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


    // sign out
    Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
     print(e.toString());
     return null;
    }
    }

    }