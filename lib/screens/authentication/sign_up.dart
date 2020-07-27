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
 // var dropDown = ['customer','seller'];
  String category = '';
 // String dropDownValue='customer';
  String email = '';
  String password = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text('SignUp',style: TextStyle(color: Colors.blue,fontSize: 30.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20.0),
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/logo.jpg'),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),
                    validator: (val) => val.isEmpty ? 'Name is Required' : null,
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Address'),
                    validator: (val) => val.isEmpty ? 'Address is Required' : null,
                    onChanged: (val) {
                      setState(() => address = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'NIC Number'),
                    //-----------------------------------------
                    validator: (val){
                      if(val.isEmpty){
                        return 'Email is Required';
                      }

                      if(!RegExp(r'^([0-9]{9}[x|X|v|V]|[0-9]{12})$').hasMatch(val)){
                        return 'Please enter valid NIC Number';
                      }
                      return null;
                    },
                    //----------------------------------------
                    /*validator: (val){
                      if(val.isEmpty){
                        return 'Email is Required';
                      }
                      if(val.length < 10){
                        return 'Please enter valid NIC Number';
                      }
                      return null;
                    },*/
                    onChanged: (val) {
                      setState(() => nic = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Telephone Number'),
                    //maxLength: 10,
                    //validator: (val) => val.isEmpty ? 'Telephone Number is Required' : null,
                    keyboardType: TextInputType.phone,
                    //-------------------------------------------------
                    validator: (val){
                      if(val.isEmpty){
                        return 'Telephone Number is Required';
                      }

                      if(!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(val)){
                        return 'Please enter valid Telephone Number';
                      }
                      return null;
                    },
                    //----------------------------------------------------
                    onChanged: (val) {
                      setState(() => phoneNo = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  //---------------------------------
                  /*DropdownButton<String>(
                    items: dropDown.map((String dropDownStringItem){
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: ( String val) {
                      setState(() {
                        this.category = val;
                      });
                    },
                    value: category,
                  ),*/
                  //---------------------------------
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Customer or Seller'),
                    onChanged: (val) {
                      setState(() => category = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                   //-------------------------------------------------------------------
                   validator: (val){
                      if(val.isEmpty){
                        return 'Email is Required';
                      }

                      if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(val)){
                        return 'Please enter valid email';
                      }
                      return null;
                   },
//--------------------------------------------------------------
                   // validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },

                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    obscureText: true,
                    validator: (val){
                      if(val.isEmpty){
                        return 'Password is Required';
                      }
                      if(val.length < 6){
                        return 'Enter a password 6+ chars long';
                      }
                      return null;
                    },
                    //validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
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
                    child: Row(
                      children: <Widget>[
                        Text("Do you have an account yet?",style: TextStyle(color: Colors.grey),),
                        FlatButton(
                          child: Text('SignIn',style: TextStyle(color: Colors.blue),),
                          onPressed: ()=> widget.toggleView(),
                        ),
                      ],
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
