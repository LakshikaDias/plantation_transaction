import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantationtransaction/models/seller.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/screens/home/seller_tile.dart';


/*class RequestSellers extends StatefulWidget {
  @override
  _RequestSellersState createState() => _RequestSellersState();
}

class _RequestSellersState extends State<RequestSellers> {
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



