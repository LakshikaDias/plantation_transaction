import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/home/home.dart';


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
    );
  }
}
