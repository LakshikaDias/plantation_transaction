import 'package:flutter/material.dart';
import 'package:plantationtransaction/models/seller.dart';
import 'package:plantationtransaction/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/services/database.dart';
import 'package:plantationtransaction/screens/admin/request_sellers.dart';

class Admin extends StatefulWidget {
  final Seller seller;
  Admin({this.seller});
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Seller>>.value(
      value: DatabaseService().sellers,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin Panel....'),
          backgroundColor: Colors.blue,
        ),
        body: RequestSellers(),
      ),
    );
  }
}