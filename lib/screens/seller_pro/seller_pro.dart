import 'package:flutter/material.dart';
import 'package:plantationtransaction/screens/home/home.dart';
import 'package:plantationtransaction/shared/constants.dart';

class SellerProfile extends StatefulWidget {
  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('My Profile'),
            actions: <Widget>[
              IconButton(
                color: Colors.white,
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Home() ));
                },
                icon: Icon(Icons.home),
              ),
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Dashboard',
                ),
                Tab(
                  text: 'Manage',
                )
              ],

            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Dashboard(),
              Manage()
            ],
          )
      ),
    );
  }
}

//profile dashboard.............................................................
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: ListTile(
                      title: FlatButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.people_outline),
                          label: Text("Users")),
                      subtitle: Text(
                        '7',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 60.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: ListTile(
                      title: FlatButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.category),
                          label: Text("Categories")),
                      subtitle: Text(
                        '23',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 60.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Card(
                  child: ListTile(
                      title: FlatButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.track_changes),
                          label: Text("Producs")),
                      subtitle: Text(
                        '120',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 60.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Card(
                  child: ListTile(
                      title: FlatButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.tag_faces),
                          label: Text("Sold")),
                      subtitle: Text(
                        '13',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 60.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Card(
                  child: ListTile(
                      title: FlatButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.shopping_cart),
                          label: Text("Orders")),
                      subtitle: Text(
                        '5',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 60.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Card(
                  child: ListTile(
                      title: FlatButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.close),
                          label: Text("Return")),
                      subtitle: Text(
                        '0',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 60.0),
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// profile manage...............................................................

class Manage extends StatefulWidget {
  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'product Quantity'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'product Price'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'product Category'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: textInputDecoration.copyWith(
                    hintText: 'product Discription'),
              ),
            ),
          ],
        ),
        //add and remove buttons................................................
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
                    'Remove',
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

        //add and remove buttons................................................
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
                    'Remove',
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
}
