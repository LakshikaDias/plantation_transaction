import 'package:flutter/material.dart';
import 'package:plantationtransaction/services/auth.dart';
import 'package:plantationtransaction/shared/constants.dart';
import 'package:plantationtransaction/shared/loading.dart';
class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';


  TextStyle style = TextStyle(fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    

    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Text('SignIn',style: TextStyle(color: Colors.blue,fontSize: 30.0,fontWeight: FontWeight.bold),),
                SizedBox(height: 20.0,),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/logo.jpg'),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val){
                          if(val.isEmpty){
                            return 'Enter an email';
                          }

                          if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(val)){
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        //validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Password'),
                        obscureText: true,
                        validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height:10.0),
                      FlatButton(
                        child: Text('Forgot your password?',style: TextStyle(color: Colors.red[300]),textAlign: TextAlign.right,),
                        onPressed: (){},
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if(_formKey.currentState.validate()){
                              setState(() => loading = true);
                              dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                              if(result == null) {
                                setState(() {
                                  loading = false;
                                  error = 'Could not sign in with those credentials';
                                });
                              }
                            }
                          }
                      ),
                      Center(
                        child: Row(
                          children: <Widget>[
                            Text("Don't you have an account yet?",style: TextStyle(color: Colors.grey),),
                            FlatButton(
                              child: Text("SignUp",style: TextStyle(color: Colors.blue),),
                              onPressed: ()=> widget.toggleView(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset('assets/signup1.png'),
                )
              ],
            ),
          ),
        ],

      ),
    );

  }
}
