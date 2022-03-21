import 'package:flutter/material.dart';
import 'package:plantationtransaction/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:plantationtransaction/models/seller.dart';
import 'package:plantationtransaction/models/user.dart';
import 'package:plantationtransaction/services/database.dart';
import 'package:plantationtransaction/screens/seller_pro/seller_pro.dart';
import 'package:plantationtransaction/screens/orders/cart.dart';
import 'package:plantationtransaction/screens/home/seller_tile.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    Widget drawerItem(String title, Icon icon ){

      return ListTile(
        title: Text(title),
        leading: icon,
      );
    }

    Widget appbarButton(Icon icon){
      return IconButton(
        icon: icon,
        onPressed: (){
        },
      );
    }

     //use provider to get seller list
    // start app bar of home page
    return StreamProvider<List<User>>.value(
      value: DatabaseService().sellers,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Plantations'),
            backgroundColor: Colors.blue,
            actions: <Widget>[
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: (){
              //   },
              // ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () async{
                  await _auth.signOut();
                },
              ),
              // IconButton(
              //   onPressed: (){},
              //   icon: Icon(Icons.more_vert),
              // ),
            ],


            /* bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'ShopsHere',
                ),
              ],
            ),*/


          ),

          // end home page app bar
          // Start home page Drawer

          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                //   header
                UserAccountsDrawerHeader(
                  // accountName:Text('User name') ,
                  // accountEmail:Text('User email') ,
                  currentAccountPicture: GestureDetector(
                    //goto seller profile
                    child: InkWell(
                      onTap: () async{
                        await _auth.authorizeAccess(context);
                       //AuthService.authorizeAccess(context);
                        //Navigator.push(context,
                            //MaterialPageRoute(builder: (context)=>SellerProfile()));
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/customer1.jpg',),
                      ),
                    ),
                  ),
                ),

                // body of the drawer

                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Home() ));
                  },
                  child: drawerItem('Home Page', Icon(Icons.home)),
                ),
                InkWell(
                  onTap: (){},
                  child: drawerItem('My Account', Icon(Icons.person)),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Cart() ));
                  },
                  child: drawerItem('Order', Icon(Icons.shopping_basket)),
                ),
                Divider(),
                InkWell(
                  onTap: (){},
                  child: drawerItem('Setting', Icon(Icons.settings)),
                ),
              ],
            ),
          ),

          // End of the Drawer
          // Body of the home page

          body: ShopsHere(),
        ),
      ),
    );

  }
}


















//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================


/*class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Seller>>.value(
      value: DatabaseService().sellers,
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
              icon: Icon(Icons.person),
              onPressed: () async{
                await _auth.signOut();
              },
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert),
            ),
          ],


         /* bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'ShopsHere',
              ),
            ],
          ),*/


        ),
        //------------------------------------------------------------------------------------------------------------------
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              //   header
              UserAccountsDrawerHeader(
                accountName:Text('User name') ,
                accountEmail:Text('User email') ,
                currentAccountPicture: GestureDetector(
                  //============================================= goto seller profile==========================
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>SellerProfile()));
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/customer1.jpg',),
                    ),
                  ),
                ),
              ),

              // =======================================================body of the drawer======================
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Home() ));
                },
                child: ListTile(
                  title: Text('Home page'),
                  leading: Icon(Icons.home),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('My account'),
                  leading: Icon(Icons.person),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Cart() ));
                },
                child: ListTile(
                  title: Text('Orders'),
                  leading: Icon(Icons.shopping_basket),
                ),
              ),
              Divider(),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                ),
              ),
            ],
          ),
        ),
        //------------------------------------------------------------------------------------------------------------------
        body: ShopsHere(),
        ),
      );

  }
}*/




