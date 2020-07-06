import 'package:flutter/material.dart';
import 'package:plantationtransaction/services/auth.dart';
import 'package:plantationtransaction/shared/constants.dart';
import 'package:plantationtransaction/shared/loading.dart';


class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({ this.toggleView });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String name = '';
  String address = '';
  String nic = '';
  String phoneNo = '';
  String category = '';
  String email = '';
  String password = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[50],
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  CircleAvatar(

                    backgroundImage: AssetImage('assets/logo.jpg'),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Address'),
                    onChanged: (val) {
                      setState(() => address = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'NIC Number'),
                    onChanged: (val) {
                      setState(() => nic = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Telephone Number'),
                    onChanged: (val) {
                      setState(() => phoneNo = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Customer or Seller'),
                    onChanged: (val) {
                      setState(() => category = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
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
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          setState(() => loading = true);
                          dynamic result = await _auth.signUpWithEmailAndPassword(name, address,nic,phoneNo,category,email, password);
                          if(result == null) {
                            setState(() {
                              loading = false;
                              error = 'Please supply a valid email';
                            });
                          }
                        }
                      }
                  ),
                  Center(
                    child: FlatButton(
                      child: Text('sigin',),
                      onPressed: ()=> widget.toggleView(),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ],

          ),
        ),
      ),
    );

  }
}
