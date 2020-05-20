import 'package:flutter/material.dart';
import 'package:plantationtransaction/models/user.dart';
import 'package:plantationtransaction/screens/wrapper.dart';
import 'package:plantationtransaction/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

