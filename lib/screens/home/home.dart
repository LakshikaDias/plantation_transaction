import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/home/shop_here.dart';
import 'package:plantationtransaction/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/models/seller.dart';
import 'package:plantationtransaction/services/database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Seller>>.value(
      value: DatabaseService().sellers,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Plantations'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () async{
                await _auth.signOut();
              },
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert),
            ),
          ],


         /* bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'ShopsHere',
              ),
            ],
          ),*/


        ),
        body: ShopsHere(),
        ),
      );

  }
}




