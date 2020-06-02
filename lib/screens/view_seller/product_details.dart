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
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.prodDetailName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('\$${widget.prodDetailPrice}',
                        style: TextStyle(color: Colors.red),),
                      ),
                      Expanded(
                        child: Text(widget.prodDetailQuantity,
                          style: TextStyle(color: Colors.red), ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Quantity'),),
                      Expanded(child: Icon(Icons.arrow_drop_down),),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Buy Now'),
                ),
              ),
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product Details', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text('Product Name:', style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
              child: Text(widget.prodDetailName),),
            ],
          ),
          //  want to do =========================================================
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text('Seller:', style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text('Seller name'),),
            ],
          ),
          //  want to do=====================================================
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text('Product Condition:', style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text('New'),),
            ],
          ),
        ],
      ),
    );
  }
}
