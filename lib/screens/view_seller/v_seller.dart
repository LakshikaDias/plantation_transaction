import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/home/home.dart';
import 'package:plantationtransaction/screens/view_seller/categories.dart';
import 'package:plantationtransaction/screens/view_seller/products.dart';
class SellerView extends StatefulWidget {
  @override
  _SellerViewState createState() => _SellerViewState();
}

class _SellerViewState extends State<SellerView> {
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
          IconButton(
            icon:Icon(Icons.shopping_cart),
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

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //   header
            UserAccountsDrawerHeader(
              accountName:Text('User name') ,
              accountEmail:Text('User email') ,
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/customer1.jpg'),
                ),
              ),
            ),

            // body of the drawer.....................................................................................................
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Home() ));
              },
              child: ListTile(
                title: Text('Home page'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
      body:ListView(
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
}
