import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantationtransaction/models/seller.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/screens/home/seller_tile.dart';

class ShopsHere extends StatefulWidget {

  @override
  _ShopsHereState createState() => _ShopsHereState();
}

class _ShopsHereState extends State<ShopsHere> {

  @override
  Widget build(BuildContext context) {

    final sellers = Provider.of<List<Seller>>(context);
     sellers.forEach((seller){
       print(seller.name);
       print(seller.address);
     });
return ListView.builder(
  itemCount: sellers.length,
    itemBuilder:(context,index){
    return SellerTile(seller:sellers[index]);
    }

);


   /* return Scaffold(

      body: ListView.builder(

        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)

            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 55.0,
                        height: 55.0,

                        child: CircleAvatar(

                          foregroundColor: Colors.blue,
                          backgroundImage: AssetImage('assets/shop1.jpg'),
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(names[index],
                            style: TextStyle(color: Colors.black,fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(dis[index],
                            style: TextStyle(color: Colors.grey,fontSize: 17.0,),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    child: FlatButton(
                      onPressed: (){},
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text('View', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );*/
  }
}
