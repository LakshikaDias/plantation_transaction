import 'package:flutter/material.dart';
import 'package:plantationtransaction/services/auth.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Plantations'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () async{
                await _auth.signOut();
              },
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'ShopsHere',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ShopsHere(),
          ],
        ),
      ),
    );
  }
}

class ShopsHere extends StatefulWidget {

  @override
  _ShopsHereState createState() => _ShopsHereState();
}

class _ShopsHereState extends State<ShopsHere> {
  List names = ["Shop_1", "farmer_1","Shop_2", "farmer_2","Shop_3", "farmer_3","Shop_4", "farmer_4","Shop_5", "farmer_5"];
  List dis = ["we provide grand items", "we provide low cost","we provide grand items", "we provide low cost","we provide grand items", "we provide low cost","we provide grand items", "we provide low cost","we provide grand items", "we provide low cost"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
    );
  }
}



