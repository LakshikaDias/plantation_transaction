import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/authentication/sign_in.dart';
import 'package:plantationtransaction/screens/authentication/sign_up.dart';
class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView:  toggleView);
    } else {
      return SignUp(toggleView:  toggleView);
    }
  }
}
