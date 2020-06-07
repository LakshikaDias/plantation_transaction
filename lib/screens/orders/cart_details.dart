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
      body: CartProducts(),
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
// each products of the cart=================================================================================================

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var ProductInTheCart=[
    {
      'name': 'Banana',
      'picture':'assets/shopHere.jpg',
      'price':100,
      'quantity':'1kg',
    },
    {
      'name': 'Apple',
      'picture':'assets/shop1.jpg',
      'price':50,
      'quantity':'2kg',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ProductInTheCart.length,
        itemBuilder: (context,index){
          return SingleCartProduct(
            CartProdName: ProductInTheCart[index]['name'],
            CartProdPicture: ProductInTheCart[index]['picture'],
            CartProdPrice: ProductInTheCart[index]['price'],
            CartProdQuantity: ProductInTheCart[index]['quantity'],
          );
        }
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final CartProdName;
  final CartProdPicture;
  final CartProdPrice;
  final CartProdQuantity;

  SingleCartProduct({
    this.CartProdName,
    this.CartProdPicture,
    this.CartProdPrice,
    this.CartProdQuantity,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(CartProdPicture, width:80.0),
        title: Text(CartProdName),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Quantity:'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(CartProdQuantity),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Price:'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$$CartProdPrice'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


