

//want to delete this code===================================================================================

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/screens/home/seller_tile.dart';
import 'package:plantationtransaction/models/user.dart';


/*class ShopsHere extends StatefulWidget {

  @override
  _ShopsHereState createState() => _ShopsHereState();
}

class _ShopsHereState extends State<ShopsHere> {

  @override
  Widget build(BuildContext context) {

    final sellersDetails = Provider.of<List<User>>(context);
    if (sellersDetails != null) {
      sellersDetails.forEach((seller){
        print(seller.name);
      });
    }
    return (sellersDetails ==null || sellersDetails.isEmpty)? Text('There are no sellers yet'): ListView.builder(
        itemCount: sellersDetails.length,
        itemBuilder:(context,index){
          return SellerTile(seller: sellersDetails[index],);
        }

    );
  }
}*/













//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================


/*class ShopsHere extends StatefulWidget {

  @override
  _ShopsHereState createState() => _ShopsHereState();
}

class _ShopsHereState extends State<ShopsHere> {

  @override
  Widget build(BuildContext context) {

    final sellers = Provider.of<List<Seller>>(context);
    if (sellers != null) {
      sellers.forEach((seller){
        print(seller.name);
        print(seller.address);
      });
    }
    return (sellers ==null || sellers.isEmpty)? Text('empty'): ListView.builder(
        itemCount: sellers.length,
        itemBuilder:(context,index){
          return SellerTile(seller:sellers[index]);
        }

    );
  }
}*/
