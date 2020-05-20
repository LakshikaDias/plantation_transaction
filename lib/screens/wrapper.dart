import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/authentication/authenticate.dart';
import 'package:plantationtransaction/screens/authentication/choose.dart';
import 'package:plantationtransaction/screens/authentication/sign_in.dart';
import 'package:plantationtransaction/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
