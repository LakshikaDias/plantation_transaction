import 'package:flutter/material.dart';
import 'package:plantationtransaction/models/product.dart';
import 'package:plantationtransaction/screens/home/home.dart';
import 'package:plantationtransaction/screens/orders/cart.dart';
import 'package:plantationtransaction/screens/view_seller/products.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/services/database.dart';

class ProductDetails extends StatelessWidget {
  final productName;
  final produtPrice;
  final productCate;
  final productQuantity;
  final productDis;
  //final productImageList;
  ProductDetails(this.productName,this.produtPrice,this.productCate,this.productQuantity,this.productDis);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Product>>.value(
      value: DatabaseService().products(productName),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(productName),
          actions: <Widget>[
            IconButton(
              icon:Icon(Icons.search,),
              onPressed: (){},
            ),
            IconButton(
              icon:Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Cart() ));
              },
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
        body:Padding(
          padding: EdgeInsets.only(top:8.0),
          child:Column(
            children: <Widget>[
              Container(
                height: 300.0,
                child: GridTile(
                  child: Container(
                    color: Colors.white,
                    child: Image.asset('assets/apple.png'),
                  ),
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(productName,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      title: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text('\$${produtPrice}',
                              style: TextStyle(color: Colors.red),),
                          ),
                          Expanded(
                            child: Text(productQuantity,
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
                subtitle: Text(productDis),
              ),
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
              Divider(),
              Text(productName),
              Text(produtPrice),
              Text(productCate),
              Text(productQuantity),
            ],
          ),

        ),
      ),
    );
  }
}


/*class ProductDetails extends StatefulWidget {


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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Cart() ));
            },
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
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar Product'),
          ),
          // Similar Products Section ======================================================
          Container(
            height: 360.0,
            //child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}*/































































































































/*class SimilarProducts extends StatefulWidget {

  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {

  var productList = [
    {
      'name':'Banana',
      'picture':'assets/shopHere.jpg',
      'quantity': '1kg',
      'price':100,
    },

    {
      'name':'Mango',
      'picture':'assets/logo.jpg',
      'quantity': '500g',
      'price':70,
    },
    {
      'name':'Tomato',
      'picture':'assets/logo1.png',
      'quantity': '1kg',
      'price':60,
    },


  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return SimilarSingleProduct(
            prodName: productList[index]['name'],
            prodPicture: productList[index]['picture'],
            prodQuantity: productList[index]['quantity'],
            prodPrice: productList[index]['price'],
          );
        });
  }
}

class SimilarSingleProduct extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ProductDetails(
                    prodDetailName: prodName,
                    prodDetailPicture: prodPicture,
                    prodDetailQuantity: prodQuantity,
                    prodDetailPrice: prodPrice,
                  ) ));
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(prodName, style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Text('\$$prodPrice', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  subtitle: Text(prodQuantity, style: TextStyle(color: Colors.green),),
                ),
              ),
              child: Image.asset(prodPicture, fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}*/







//33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
//33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
//33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
//33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
/*class ProductDetails extends StatefulWidget {
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Cart() ));
            },
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
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar Product'),
          ),
          // Similar Products Section ======================================================
          Container(
            height: 360.0,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {

  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {

  var productList = [
    {
      'name':'Banana',
      'picture':'assets/shopHere.jpg',
      'quantity': '1kg',
      'price':100,
    },

    {
      'name':'Mango',
      'picture':'assets/logo.jpg',
      'quantity': '500g',
      'price':70,
    },
    {
      'name':'Tomato',
      'picture':'assets/logo1.png',
      'quantity': '1kg',
      'price':60,
    },


  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return SimilarSingleProduct(
            prodName: productList[index]['name'],
            prodPicture: productList[index]['picture'],
            prodQuantity: productList[index]['quantity'],
            prodPrice: productList[index]['price'],
          );
        });
  }
}

class SimilarSingleProduct extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodQuantity;
  final prodPrice;

  SimilarSingleProduct({
    this.prodName,
    this.prodPicture,
    this.prodQuantity,
    this.prodPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ProductDetails(
                    prodDetailName: prodName,
                    prodDetailPicture: prodPicture,
                    prodDetailQuantity: prodQuantity,
                    prodDetailPrice: prodPrice,
                  ) ));
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(prodName, style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Text('\$$prodPrice', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  subtitle: Text(prodQuantity, style: TextStyle(color: Colors.green),),
                ),
              ),
              child: Image.asset(prodPicture, fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}*/
