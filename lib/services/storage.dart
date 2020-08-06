import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

/*class StorageService{

  Future<String> uploadAvatar({@required String uid, @required File file}) async {
    return await uploadFile(
      uid: uid,
      file: file,
      path: 'avatar/$uid/' + 'avatar.png',
      contentType: 'image/png',
    );
  }


  Future<String>uploadFile({

    @required String uid,
    @required File file,
    @required String path,
    @required String contentType,

  })async {

    final StorageReference storageReference = FirebaseStorage.instance.ref().child(path);
    final uploadTask = storageReference.putFile(
        file, StorageMetadata(contentType: contentType)
    );
    final snapshot = await uploadTask.onComplete;
    if(snapshot.error != null){
      print('upload task not successful error : ${snapshot.error}');
      throw snapshot.error;
    }
    // URL for the image
    final imageURL = await snapshot.ref.getDownloadURL();
    print('image URL : $imageURL');
    return imageURL;
  }

}*/
//======================================================================================
 /*class StorageService{
   File _image;


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
}
 }*/
