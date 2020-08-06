import 'package:flutter/material.dart';
import 'package:plantationtransaction/models/seller.dart';
import 'package:plantationtransaction/models/user.dart';
import 'package:plantationtransaction/screens/view_seller/v_seller.dart';


class SellerTile extends StatelessWidget {
  final User seller;
  SellerTile({this.seller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('assets/shop1.jpg'),
          ),
          title: Text(seller.name),
          subtitle: Text(seller.address),
          trailing: FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>SellerView() ));
            },
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text('View', style: TextStyle(color: Colors.white),),
          ),
        ),

      ),
    );
  }
}







//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================


/*class SellerTile extends StatelessWidget {
  final Seller seller;
  SellerTile({this.seller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('assets/shop1.jpg'),
          ),
          title: Text(seller.name),
          subtitle: Text(seller.address),
          trailing: FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>SellerView() ));
            },
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text('View', style: TextStyle(color: Colors.white),),
          ),
        ),

      ),
    );
  }
}*/
