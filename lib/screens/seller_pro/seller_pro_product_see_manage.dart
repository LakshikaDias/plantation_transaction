import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantationtransaction/models/product.dart';
import 'package:plantationtransaction/screens/view_seller/products.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/services/database.dart';

// Add personal product list to the seller's profile

// get the product list
class ProductSeeManage extends StatefulWidget {
  @override
  _ProductSeeManageState createState() => _ProductSeeManageState();
}

class _ProductSeeManageState extends State<ProductSeeManage> {
  @override
  Widget build(BuildContext context) {
    final PersonalProductList = Provider.of<List<Product>>(context);
    if(PersonalProductList != null){
      PersonalProductList.forEach((pro){
        print(pro.pName);
      });
    }
    return(PersonalProductList == null ||PersonalProductList.isEmpty)? Text('Product List is Emty'):ListView.builder(
        itemCount: PersonalProductList.length,
        itemBuilder: (context,index){
          return PersonalProduct(produ:PersonalProductList[index]);
        }
    );
  }
}


// UI code for product list
class PersonalProduct extends StatelessWidget {
  //first product from model
  final Product produ;
  PersonalProduct({this.produ});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            //backgroundImage: AssetImage('assets/apple.png'),
            backgroundImage: produ?.imageList!=null
                ?NetworkImage(produ.imageList)
                :null,
            child: produ?.imageList==null
                ?Icon(Icons.person)
                :null,
          ),
          title: Text(produ.pName),
          trailing: FlatButton(
            //to go seller's product list
            onPressed: () {
              deleteProduct(produ);
              print(produ.pName);
            },
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text('Delete', style: TextStyle(color: Colors.white),),
          ),
        ),

      ),
    );
  }

// Delete product from product list

    void deleteProduct(Product product) {
    DocumentReference documentReference = Firestore.instance.collection('products').document(product.pid);
    documentReference.delete().whenComplete((){
      print(product.pid);
    });
  }


  /*void deleteProduct() {
    DocumentReference documentReference = Firestore.instance.collection('products').document(pid);
    documentReference.delete().whenComplete((){
      print(produ.pName);
    });
  }*/
  }

 /*deleteProduct(Product product, Function productDeleted) async {
  if(product.imageList !=null){
    StorageReference storageReference =
    await FirebaseStorage.instance.getReferenceFromUrl(product.imageList);
    print(storageReference.path);
    await storageReference.delete();
    print('image deleted');
  }
  await Firestore.instance.collection('products').document(product.pid).delete();
  productDeleted(product);
}*/

  //method for delete product to the seller





  /*void deleteProduct() async{
    Firestore.instance.collection('product').document().delete().catchError((e){
      print(e);
      });
    }*/



 /* void deleteProduct() {
    DocumentReference documentReference = Firestore.instance.collection('products').documrnt();
    documentReference.delete().whenComplete((){
      print(produ.pName);
    });
  }*/






















//============================================================================
//for to doooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
/*class RemoveUpdateProducts extends StatefulWidget {
  @override
  _RemoveUpdateProductsState createState() => _RemoveUpdateProductsState();
}

class _RemoveUpdateProductsState extends State<RemoveUpdateProducts> {
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
            crossAxisCount: 1),
        itemBuilder:(context,index){
          return Products(product:productList[index]);
        }

    );

  }
}


class SellerProducts extends StatefulWidget {
  final Product product;
  SellerProducts({this.product});
  @override
  _SellerProductsState createState() => _SellerProductsState();
}

class _SellerProductsState extends State<SellerProducts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: product?.imageList!=null
                ?NetworkImage(product.imageList)
                :null,
            child: product?.imageList==null
                ?Icon(Icons.person)
                :null,
          ),
          title: Text(product.pName),
          subtitle: Text(product.pPrice),

        ),
      ),

    );
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
}*/

//=================================================================================================================
// last one
/*class SellerProducts extends StatefulWidget {
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
}*/
