import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/home/home.dart';
class ProductDetails extends StatefulWidget {
  final prodDetailName;
  final prodDetailPicture;
  final prodDetailQuantity;
  final prodDetailPrice;

  ProductDetails({
    this.prodDetailName,
    this.prodDetailPicture,
    this.prodDetailQuantity,
    this.prodDetailPrice,
});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.prodDetailPicture),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
