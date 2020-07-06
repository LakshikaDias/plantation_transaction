import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/home/home.dart';
import 'package:plantationtransaction/services/product.dart';
import 'package:plantationtransaction/screens/seller_pro/seller_pro_manage.dart';
import 'package:plantationtransaction/screens/seller_pro/seller_pro_dashbourd.dart';

class SellerProfile extends StatefulWidget {
  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('My Profile'),
            actions: <Widget>[
              IconButton(
                color: Colors.white,
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Home() ));
                },
                icon: Icon(Icons.home),
              ),
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Dashboard',
                ),
                Tab(
                  text: 'Manage',
                )
              ],

            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Dashboard(),
              Manage()
            ],
          )
      ),
    );
  }
}


