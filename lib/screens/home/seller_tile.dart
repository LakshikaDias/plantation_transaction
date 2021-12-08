import 'package:flutter/material.dart';
import 'package:plantationtransaction/models/user.dart';
import 'package:plantationtransaction/screens/view_seller/v_seller.dart';
import 'package:provider/provider.dart';

//start body of home page
//get seller list from database

class ShopsHere extends StatefulWidget {
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
}
// start to create  seller list
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
            //to go seller's product list
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>SellerView(seller.uid,seller.name, seller.phoneNo)));
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
//end of seller list






































































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
