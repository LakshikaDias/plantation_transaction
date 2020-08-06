import 'package:flutter/material.dart';
import 'package:plantationtransaction/models/seller.dart';
import 'package:plantationtransaction/models/user.dart';
import 'package:plantationtransaction/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/services/database.dart';
import 'package:plantationtransaction/screens/admin/request_sellers.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel....'),
        backgroundColor: Colors.blue,
      ),

    );
  }
}


















//==============================================================================================================================
//==============================================================================================================================
//==============================================================================================================================
/*class Admin extends StatefulWidget {
  final User seller;
  Admin({this.seller});
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<User>>.value(
      value: DatabaseService().sellers,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin Panel....'),
          backgroundColor: Colors.blue,
        ),
        //body: RequestSellers(),
      ),
    );
  }
}*/