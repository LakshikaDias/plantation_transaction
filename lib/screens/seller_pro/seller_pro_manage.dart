import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plantationtransaction/services/database.dart';
import 'package:plantationtransaction/shared/constants.dart';
class Manage extends StatefulWidget {

  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  String error = '';
  final DatabaseService _data = DatabaseService();
  //final _formKey = GlobalKey<FormState>();

  String pName ='';
  String pCategory ='';
  String pQuantity ='';
  String pPrice ='';
  String pDiscription = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // get the product image................................................
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Add new product',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )),
        Form(
          //key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.blue[100]),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
                child: new Icon(
                  Icons.add,
                  color: Colors.blue[50],
                ),
              ),
            ),
          ),
        ),
        // add product details..................................................
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                textInputDecoration.copyWith(hintText: 'product Name'),
                //==========================================================================
                onChanged: (val) {
                  setState(() => pName = val);
                },
                //=============================================================================
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                textInputDecoration.copyWith(hintText: 'product Quantity'),
                onChanged: (val) {
                  setState(() => pQuantity = val);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                textInputDecoration.copyWith(hintText: 'product Price'),
                onChanged: (val) {
                  setState(() => pPrice = val);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                textInputDecoration.copyWith(hintText: 'product Category'),
                onChanged: (val) {
                  setState(() => pCategory = val);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: textInputDecoration.copyWith(
                    hintText: 'product Discription'),
                onChanged: (val) {
                  setState(() => pDiscription = val);
                },
              ),
            ),
          ],
        ),
        //add and cancel buttons................................................
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  onPressed: () async{
                    dynamic result = await _data.updateProductData(pName,pCategory ,pQuantity ,pPrice ,pDiscription);
                    if(result == null) {
                      setState(() {
                        error = 'Please supply comlete details';
                      });
                    }
                  },
                  child: Text(
                    'Add',
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
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.yellow,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Cancel',
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



        /*Divider(),
        // new category image...................................................

        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Add new Category',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )),
        Form(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.blue[100]),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
                child: new Icon(
                  Icons.add,
                  color: Colors.blue[50],
                ),
              ),
            ),
          ),
        ),

        // category name........................................................

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Category name'),
          ),
        ),

        //add and cancel buttons................................................
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Add',
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
                  onPressed: () {},
                  child: Text(
                    'Cancel',
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
        //...................................................................
        */



      ],
    );
  }
}
























/*class Manage extends StatefulWidget {

  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  String productName;
  String productCategory;
  String productQuantity;
  String productPrice;
  String productDiscription;
  String error = '';


  getProductName(pName) {
    this.productName = pName;
  }

  getProductCategory(pCategory) {
    this.productCategory = pCategory;
  }

  getProductQuantity(pQuantity) {
    this.productQuantity = pQuantity;
  }

  getProductPrice(pPrice) {
    this.productPrice = pPrice;
  }

  getProductDiscription(pDiscription) {
    this.productDiscription = pDiscription;
  }

  createData() {
    DocumentReference documentReference = Firestore.instance.collection("product").document(productName);

    //create map
    Map<String, dynamic> product = {
      'product name': productName,
      'product price': productPrice,
      'product quantity': productQuantity,
      'product description': productDiscription,
      'product catagory': productCategory,
    };
    documentReference.setData(product).whenComplete(() {
      print('$productName created');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // get the product image................................................
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Add new product',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )),
        Form(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.blue[100]),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
                child: new Icon(
                  Icons.add,
                  color: Colors.blue[50],
                ),
              ),
            ),
          ),
        ),
        // add product details..................................................
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                textInputDecoration.copyWith(hintText: 'product Name'),
                //==========================================================================
                onChanged: (String pName) {
                  getProductName(pName);
                },
                //=============================================================================
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                textInputDecoration.copyWith(hintText: 'product Quantity'),
                onChanged: (String pQuantity) {
                  getProductQuantity(pQuantity);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                textInputDecoration.copyWith(hintText: 'product Price'),
                onChanged: (String pPrice) {
                  getProductQuantity(pPrice);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                textInputDecoration.copyWith(hintText: 'product Category'),
                onChanged: (String pCategory) {
                  getProductQuantity(pCategory);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: textInputDecoration.copyWith(
                    hintText: 'product Discription'),
                onChanged: (String pDiscription) {
                  getProductQuantity(pDiscription);
                },
              ),
            ),
          ],
        ),
        //add and cancel buttons................................................
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  //=============================================================================
                  onPressed: () {
                    createData();
                  },
                  //===============================================================================
                  child: Text(
                    'Add',
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
                  onPressed: () {},
                  child: Text(
                    'Cancel',
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
        Divider(),

        // new category image...................................................

        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Add new Category',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )),
        Form(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.blue[100]),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
                child: new Icon(
                  Icons.add,
                  color: Colors.blue[50],
                ),
              ),
            ),
          ),
        ),

        // category name........................................................

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Category name'),
          ),
        ),

        //add and cancel buttons................................................
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Add',
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
                  onPressed: () {},
                  child: Text(
                    'Cancel',
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
    );
  }
}*/










