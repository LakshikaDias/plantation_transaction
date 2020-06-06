import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/home/home.dart';
import 'package:plantationtransaction/screens/orders/cart_details.dart';


class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('My Cart'),
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
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('assets/shop1.jpg'),
              ),
              title: Text('Seller Name'),
              subtitle: Text('Seller Address , Date'),
              trailing: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>CartDetails() ));
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text('View', style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
        ],
      ) ,
    );
  }
}
