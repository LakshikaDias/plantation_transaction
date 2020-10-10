import 'package:flutter/material.dart';
import 'package:plantationtransaction/models/product.dart';
import 'package:plantationtransaction/screens/home/home.dart';
import 'package:plantationtransaction/services/product.dart';
import 'package:plantationtransaction/screens/seller_pro/seller_pro_manage.dart';
import 'package:plantationtransaction/screens/seller_pro/seller_pro_products.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/services/database.dart';



//for to doooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
/*class SellerProfile extends StatelessWidget {
  final String SellerId;
  final String SellerName;
  SellerProfile(this.SellerId, this.SellerName);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Product>>.value(
      value: DatabaseService().products(SellerId),
      child: DefaultTabController(
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
                    text: 'Products',
                  ),
                  Tab(
                    text: 'Manage',
                  )
                ],

              ),
            ),
            body: TabBarView(
              children: <Widget>[
                SellerProducts(),
                Manage()
              ],
            )
        ),
      ),
    );
  }
}*/
//===============================================================================================
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
                  text: 'Products',
                ),
                Tab(
                  text: 'Manage',
                )
              ],

            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SellerProducts(),
              Manage()
            ],
          )
      ),
    );
  }
}


