import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/authentication/sign_in.dart';
import 'package:plantationtransaction/screens/authentication/sign_up.dart';
class Choose extends StatefulWidget {
  Choose({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  TextStyle style = TextStyle(fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final signinButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>SignUp() ));
        },
        child: Text(
          'Sign In',
          textAlign: TextAlign.center,
          style: style.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>SignIn() ));
        },
        child: Text(
          'Log In',
          textAlign: TextAlign.center,
          style: style.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
    );
    /*final guestButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
        },
        child: Text(
          'Guest',
          textAlign: TextAlign.center,
          style: style.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
    );*/
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset('assets/logo.jpg', fit: BoxFit.contain,),
                ),
                SizedBox(height: 45.0,),
                signinButton,
                SizedBox(height: 25.0,),
                loginButton,
                //SizedBox(height: 25.0,),
                //guestButton,
                //SizedBox(height: 15.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
