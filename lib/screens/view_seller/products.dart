import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/view_seller/product_details.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/models/product.dart';



class ProductsHere extends StatefulWidget {
  @override
  _ProductsHereState createState() => _ProductsHereState();
}

class _ProductsHereState extends State<ProductsHere> {
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<List<Product>>(context);
    if (productList != null) {
      productList.forEach((pro){
        print(pro.pName);
        print(pro.imageList);
        //print(pro.pQuantity);
      });
    }
    return (productList ==null || productList.isEmpty)? Text('empty'): GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder:(context,index){
          return Products(product:productList[index]);
        }

    );

    /*return (productList ==null || productList.isEmpty)? Text('empty'): ListView.builder(
        itemCount: productList.length,
        itemBuilder:(context,index){
          return Products(product:productList[index]);
        }

    );*/
  }
}


class Products extends StatelessWidget {
  final Product product;
  Products({this.product});

  @override
  Widget build(BuildContext context) {
    /*return Card(
      child: Hero(
        tag: product.pName,
        child: Material(
          child: InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ProductDetails(
                      product.pName,
                      product.pPrice,
                      product.pCategory,
                      product.pQuantity,
                      product.pDiscription,
                      product.imageList) ));

            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(product.pName, style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Text(product.pPrice, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  subtitle: Text(product.pQuantity, style: TextStyle(color: Colors.green),),
                ),
              ),
              child: Image.asset(product.imageList, fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );*/
   return Padding(
     padding: EdgeInsets.only(top:8.0),
     child: Card(
       margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
       child: ListTile(
         leading: CircleAvatar(
           radius: 25.0,
           //backgroundImage: AssetImage('assets/apple.png'),
           backgroundImage: product?.imageList!=null
           ?NetworkImage(product.imageList)
           :null,
          child: product?.imageList==null
           ?Icon(Icons.person)
           :null,
         ),
         title: Text(product.pName),
         subtitle: Text(product.pPrice),
         onTap: (){
           print(product.imageList);
           Navigator.push(context,
               MaterialPageRoute(builder: (context)=>ProductDetails(
                   product.pName,
                   product.pPrice,
                   product.pCategory,
                   product.pQuantity,
                   product.pDiscription,
                   product.imageList,
                   ) ));
         },

       ),
     ),
   );
  }
}






























































//222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222

/*class Products extends StatefulWidget {
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
}*/



