import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 class SellerProducts extends StatefulWidget {
   @override
   _SellerProductsState createState() => _SellerProductsState();
 }

 class _SellerProductsState extends State<SellerProducts> {
   var pList = [
     {
       'name':'Grapes',
       'picture':'assets/grapes.png',
       'quantity': '500g',
       'price':70,
       'dis':'fuifhufhefjejfjefjef',
     },
     {
       'name':'Corn',
       'picture':'assets/corn.png',
       'quantity': '500g',
       'price':70,
       'dis':'vihvidivichvbvh ',
     },
     {
       'name':'Apple',
       'picture':'assets/apple.png',
       'quantity': '500g',
       'price':70,
       'dis':'okoekpokeopdkeqop',
     },
   ];
   @override
   Widget build(BuildContext context) {
     return GridView.builder(
         itemCount: pList.length,
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 1),
         itemBuilder: (BuildContext context, int index){
           return SingleProduct(
             prodName: pList[index]['name'],
             prodPicture: pList[index]['picture'],
             prodQuantity: pList[index]['quantity'],
             prodPrice: pList[index]['price'],
             prodDis: pList[index]['dis'],
           );
         });
   }
 }

class SingleProduct extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodQuantity;
  final prodPrice;
  final prodDis;

  SingleProduct({
    this.prodName,
    this.prodPicture,
    this.prodQuantity,
    this.prodPrice,
    this.prodDis,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset(prodPicture, width: 100.0, height: 100.0,),
                ),
              ),
              Text(prodName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),),
            ],
          ),
          Divider(),
          Text('Price : \$$prodPrice', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          Divider(),
          Text('Quantity : $prodQuantity', style: TextStyle(color: Colors.green),),
          Divider(),
          Text('Discription : $prodDis'),
          Divider(),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: (){},
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: (){},
                    child: Text(
                      'Romve',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
