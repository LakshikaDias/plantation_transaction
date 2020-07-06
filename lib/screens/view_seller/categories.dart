import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation:'assets/vegitables.png' ,
            imageCaption: 'vegitables',
          ),
          Category(
            imageLocation:'assets/fruits.png' ,
            imageCaption: 'fruits',
          ),
          /*Category(
            imageLocation:'assets/customer1.jpg' ,
            imageCaption: 'others',
          ),
          Category(
            imageLocation:'assets/customer1.jpg' ,
            imageCaption: 'others',
          ),
          Category(
            imageLocation:'assets/customer1.jpg' ,
            imageCaption: 'others',
          ),*/

        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({
    this.imageLocation,
    this.imageCaption,
});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(onTap: (){},
    child: Container(
      width: 100.0,
      height: 200.0,
      child: ListTile(
        title: Image.asset(imageLocation),
        subtitle: Container(
          alignment: Alignment.topCenter,
          child: Text(imageCaption),
        ),
      ),
    ),
    ) ,
    );
  }
}
