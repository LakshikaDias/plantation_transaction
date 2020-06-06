import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/home/home.dart';

class CartDetails extends StatefulWidget {

  @override
  _CartDetailsState createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Seller Name'),
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
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text('Total:'),
                subtitle: Text('\$230'),
              ),
            ),
            Expanded(
              child: MaterialButton(onPressed: (){},
              child: Text('Check Out', style: TextStyle(color: Colors.white),),
              color: Colors.red,
              ),
            ),
          ],
        ),
      ),

    );
  }
}