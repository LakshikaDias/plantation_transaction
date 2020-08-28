import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantationtransaction/models/product.dart';
import 'package:plantationtransaction/screens/home/home.dart';
import 'package:plantationtransaction/screens/orders/cart.dart';
import 'package:plantationtransaction/screens/seller_pro/seller_pro.dart';
import 'package:plantationtransaction/screens/view_seller/categories.dart';
import 'package:plantationtransaction/screens/view_seller/products.dart';
import 'package:plantationtransaction/services/auth.dart';
import 'package:plantationtransaction/services/database.dart';
import 'package:provider/provider.dart';


class SellerView extends StatelessWidget {
  final String SellerId;
  final String SellerName;
  SellerView(this.SellerId, this.SellerName);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Product>>.value(
      value: DatabaseService().products(SellerId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(SellerName),
          actions: <Widget>[
            IconButton(
              icon:Icon(Icons.search,),
              onPressed: (){},
            ),
            IconButton(
              icon:Icon(Icons.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Home() ));
              },
            ),
          ],
        ),
        body:Container(
          child: ProductsHere(),
        )

      ),
    );
  }
}






/*class SellerView extends StatefulWidget {
  final String SellerId;
  SellerView(this.SellerId);
  @override
  _SellerViewState createState() => _SellerViewState();
}

class _SellerViewState extends State<SellerView> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    //final data = MediaQuery.of(context);
    return StreamProvider<List<Product>>.value(
        value: DatabaseService().products(SellerId),
      child: Scaffold(

      ),
    );
  }
}*/





//take under code if you you forget what you did
//22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
/*class SellerView extends StatefulWidget {
  @override
  _SellerViewState createState() => _SellerViewState();
}

class _SellerViewState extends State<SellerView> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    //final data = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
         title: Text('Shop name'),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.search,),
            onPressed: (){},
          ),
          /*IconButton(
            icon:Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Cart() ));
            },
          ),*/
          IconButton(
            icon:Icon(Icons.home),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Home() ));
            },
          ),
        ],
      ),

      body: ListView(
        children: <Widget>[
          // shop profile image
          Image.asset('assets/shopHere.jpg',),

          // padding widget
          Padding(padding: const EdgeInsets.all(8.0),
          child: Text('Categories'),
          ),

          // Horizontal list view begin here
            CategoryList(),

          // padding widget
          Padding(padding: const EdgeInsets.all(20.0),
            child: Text('Recent product'),
          ),

          // grid view
          Container(
            height: 320.0,
            child: Products(),
          ),

        ],
      ),
    );
  }
}*/
