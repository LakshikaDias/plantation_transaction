
import 'package:flutter/material.dart';
import 'package:plantationtransaction/services/database.dart';
import 'package:plantationtransaction/shared/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// in this case only add the product to the data base

class AddProduct extends StatefulWidget {

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String error = '';
  final DatabaseService _data = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  File _image1;

  String pName ='';
  String pCategory ='';
  String pQuantity ='';
  String pPrice ='';
  String pDiscription = '';
  String image='';



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
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlineButton(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width:2.5 ),
                            onPressed: (){
                              // take1 images from gallery
                              _selectImage(ImagePicker.pickImage(source: ImageSource.gallery));
                            },
                            child: _displayChild1()
                        ),
                      ),
                    ),
                  ],
                )
              ],
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

                validator: (val) => val.isEmpty ? 'Name is Required' : null,
                onChanged: (val) {
                  setState(() => pName = val);
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                textInputDecoration.copyWith(hintText: 'product Quantity'),
                validator: (val) => val.isEmpty ? 'Quantity is Required' : null,
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
                validator: (val) => val.isEmpty ? 'Price is Required' : null,
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
                validator: (val) => val.isEmpty ? 'Category is Required' : null,
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
                validator: (val) => val.isEmpty ? 'Product Discription is Required' : null,
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
                    validateAndUpload();
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
            /*Expanded(
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
            ),*/
          ],
        ),
      ],
    );
  }
// select images from gallery
  void _selectImage(Future<File> pickImage) async {
    File tempImg = await pickImage;
    setState(()=>_image1 = tempImg);

  }
// display images in outline buttons
  Widget _displayChild1() {
    if(_image1==null){
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: Icon(Icons.add,color: Colors.grey,),
      );
    }else{
      return Image.file(_image1, fit:BoxFit.fill,width: double.infinity,);
    }
  }
// validate and upload images to the firebase like a imageUrl
  void validateAndUpload() async{
    if(_formKey.currentState.validate()){
      if(_image1!=null ) {
        String imageUrl1;

        // get snapshot from the storage
        final FirebaseStorage storage = FirebaseStorage.instance;
        final String picture1 = "1${DateTime
            .now()
            .millisecondsSinceEpoch
            .toString()}.jpg";
        StorageUploadTask task1 = storage.ref().child(picture1).putFile(
            _image1);
        StorageTaskSnapshot snapshot1 = await task1.onComplete.then((
            snapshot) => snapshot);

        // get imageUrl from snapshot
        task1.onComplete.then((snapshot3) async {
          imageUrl1 = await snapshot1.ref.getDownloadURL();
          String image = imageUrl1;
          dynamic result = _data.updateProductData(
              pName, pCategory, pQuantity, pPrice, pDiscription, image);
          if (result == null) {
            setState(() {
              error = 'Please supply comlete details';
            });
          } else {
            print(image);
          }
        });
        _formKey.currentState.reset();
      }
    }
  }
}

// third comment========================================================================================================
/*class Manage extends StatefulWidget {

  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  String error = '';
  final DatabaseService _data = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  File _image1;
  File _image2;
  File _image3;

  String pName ='';
  String pCategory ='';
  String pQuantity ='';
  String pPrice ='';
  String pDiscription = '';
  String imageList='';



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
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlineButton(
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width:2.5 ),
                          onPressed: (){
                            // take1 images from gallery
                            _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),1);
                          },
                          child: _displayChild1()
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlineButton(
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width:2.5 ),
                          onPressed: (){
                            // take2 images from gallery
                            _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),2);
                          },
                            child: _displayChild2()
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlineButton(
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width:2.5 ),
                          onPressed: (){
                            // take3 images from gallery
                            _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),3);
                          },
                            child: _displayChild3()
                        ),
                      ),
                    )
                  ],
                )
              ],
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

                validator: (val) => val.isEmpty ? 'Name is Required' : null,
                onChanged: (val) {
                  setState(() => pName = val);
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration:
                textInputDecoration.copyWith(hintText: 'product Quantity'),
                validator: (val) => val.isEmpty ? 'Quantity is Required' : null,
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
                validator: (val) => val.isEmpty ? 'Price is Required' : null,
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
                validator: (val) => val.isEmpty ? 'Category is Required' : null,
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
                validator: (val) => val.isEmpty ? 'Product Discription is Required' : null,
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
                    validateAndUpload();
                    //dynamic result = await _data.updateProductData(pName,pCategory ,pQuantity ,pPrice ,pDiscription,imageList);
                   /* if(result == null) {
                      setState(() {
                        error = 'Please supply comlete details';
                      });
                    }*/
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
      ],
    );
  }
// select images from gallery
  void _selectImage(Future<File> pickImage, int imageNumder) async {
    File tempImg = await pickImage;
    switch(imageNumder){
     case 1:setState(()=>_image1 = tempImg);
     break;
     case 2:setState(()=>_image2 = tempImg);
     break;
     case 3:setState(()=>_image3 = tempImg);
     break;
    }

  }
// display images in outline buttons
  Widget _displayChild1() {
    if(_image1==null){
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: Icon(Icons.add,color: Colors.grey,),
      );
    }else{
      return Image.file(_image1, fit:BoxFit.fill,width: double.infinity,);
    }
  }
  Widget _displayChild2() {
    if(_image2==null){
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: Icon(Icons.add,color: Colors.grey,),
      );
    }else{
      return Image.file(_image2,fit:BoxFit.fill,width: double.infinity,);
    }
  }
  Widget _displayChild3() {
    if(_image3==null){
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: Icon(Icons.add,color: Colors.grey,),
      );
    }else{
      return Image.file(_image3,fit:BoxFit.fill,width: double.infinity,);
    }
  }
// validate and upload images to the firebase like a imageUrl
  void validateAndUpload() async{
    if(_formKey.currentState.validate()){
      if(_image1!=null && _image2!=null && _image3!=null){
        String imageUrl1;
        String imageUrl2;
        String imageUrl3;

        // get snapshot from the storage
        final FirebaseStorage storage = FirebaseStorage.instance;
        final String picture1 = "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task1 = storage.ref().child(picture1).putFile(_image1);
        final String picture2 = "2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task2 = storage.ref().child(picture2).putFile(_image2);
        final String picture3 = "3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task3 = storage.ref().child(picture3).putFile(_image3);
        StorageTaskSnapshot snapshot1 = await task1.onComplete.then((snapshot)=>snapshot);
        StorageTaskSnapshot snapshot2 = await task2.onComplete.then((snapshot)=>snapshot);

        // get imageUrl from snapshot
        task3.onComplete.then((snapshot3)async{
         imageUrl1 = await snapshot1.ref.getDownloadURL();
         imageUrl2 = await snapshot2.ref.getDownloadURL();
         imageUrl3 = await snapshot3.ref.getDownloadURL();
         List<String> imageList = [imageUrl1,imageUrl2,imageUrl3];
         dynamic result = _data.updateProductData(pName, pCategory, pQuantity, pPrice, pDiscription, imageList);
         if(result == null) {
           setState(() {
             error = 'Please supply comlete details';
           });
         }else{
           print(imageList);
         }
        });
        _formKey.currentState.reset();
        //Fluttertoast.showToast(msg: 'Product added');
      }/*else{
        Fluttertoast.showToast(msg: 'All the images must be provided');
      }*/
    }
  }
}*/







// Second comment=======================================================================================================================

/*class Manage extends StatefulWidget {

  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  String error = '';
  final DatabaseService _data = DatabaseService();


  String pName ='';
  String pCategory ='';
  String pQuantity ='';
  String pPrice ='';
  String pDiscription = '';
  File _image;


  @override
  Widget build(BuildContext context) {

    Future getImage() async{
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }


   // upload image to firebase storage
   Future uploadPic(BuildContext context) async{
     String fileName = basename(_image.path);
     StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
     StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
     //StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
     //------------------------------------------------------
     final snapshot = await uploadTask.onComplete;
     if(snapshot.error != null){
       print('upload task not successful error : ${snapshot.error}');
       throw snapshot.error;
     }
     // URL for the image
     final imageURL = await snapshot.ref.getDownloadURL();
     print('image URL : $imageURL');
     return imageURL;


      //----------------------------------------------------------

      //setState(() {
       // print('Product picture upload');
       // Scaffold.of(context).showSnackBar(SnackBar(content:Text('Product picture uploaded')));
     // });

    }
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


        /*Form(
          key: _formKey,
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
        ),*/
        // add product details..................................................
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.blue,
                    child: ClipOval(
                      child: SizedBox(
                        width: 180.0,
                        height: 180.0,
                        child: (_image!=null)?Image.file(_image,fit: BoxFit.fill,)
                            :Image.asset('assets/apple.png', fit:BoxFit.fill,),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: IconButton(icon: Icon(Icons.camera_alt, size: 30.0,),
                    onPressed: (){
                      getImage();
                    },
                  ),
                ),
              ],
            ),
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

                    //-------------------------------------------------------------------
                    uploadPic(context);

                    //-------------------------------------------------------------------------------
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
      ],
    );
  }

}*/





// first comment========================================================================================================================

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











