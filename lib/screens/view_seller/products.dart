import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/view_seller/product_details.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      'name':'Corn',
      'picture':'assets/corn.png',
      'quantity': '1kg',
      'price':100,
    },
    {
      'name':'Apple',
      'picture':'assets/apple.png',
      'quantity': '2kg',
      'price':50,
    },
    {
      'name':'Grapes',
      'picture':'assets/grapes.png',
      'quantity': '500g',
      'price':70,
    },
    {
      'name':'Orange',
      'picture':'assets/orange.png',
      'quantity': '1kg',
      'price':60,
    },
    {
      'name':'Carrots',
      'picture':'assets/carrot.png',
      'quantity': '2kg',
      'price':40,
    },
    {
      'name':'Stoberrry',
      'picture':'assets/shop1.jpg',
      'quantity': '2kg',
      'price':150,
    },

  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return SingleProduct(
            prodName: productList[index]['name'],
            prodPicture: productList[index]['picture'],
            prodQuantity: productList[index]['quantity'],
            prodPrice: productList[index]['price'],
          );
        });
  }
}
class SingleProduct extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodQuantity;
  final prodPrice;

  SingleProduct({
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
}
