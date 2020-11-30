import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/admin_home.dart';
import 'package:e_commerce/new_item_add.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;
class add_product extends StatefulWidget {
  @override
  _add_productState createState() => _add_productState();
}

class _add_productState extends State<add_product> {
  final picker = ImagePicker();
  File _imageFile;
  TextEditingController title=new TextEditingController();
  TextEditingController price=new TextEditingController();
  TextEditingController dec=new TextEditingController();
  String _uploadedFileURL;
  final Color green = Colors.brown;
  final Color orange = Colors.brown;
  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Firestore File Upload'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Add Image from product',style: TextStyle(fontSize: 20),),
            SizedBox(height: 20.0),
            Expanded(
              flex: 1,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: double.infinity,
                              margin: const EdgeInsets.only(
                                  left: 30.0, right: 30.0, top: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: _imageFile != null
                                    ? Image.file(_imageFile)
                                    : FlatButton(
                                  child: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.blue,
                                    size: 50,
                                  ),
                                  onPressed: pickImage,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: TextFormField(
                    validator: (String value){
                      if(value.isEmpty){
                        return 'Please Enter title';
                      }
                      return null;
                    },
                    controller: title,
                    decoration: InputDecoration(
                      hintText: "Title",
                      prefixIcon: Icon(Icons.title),
                      filled: true,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: TextFormField(
                    validator: (String value){
                      if(value.isEmpty){
                        return 'Please Enter price';
                      }
                      return null;
                    },
                    controller: price,
                    decoration: InputDecoration(
                      hintText: "Price",
                      prefixIcon: Icon(Icons.attach_money),
                      filled: true,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: TextFormField(
                    validator: (String value){
                      if(value.isEmpty){
                        return 'Please Enter category';
                      }
                      return null;
                    },
                    controller: dec,
                    decoration: InputDecoration(
                      hintText: "Category",
                      prefixIcon: Icon(Icons.title),
                      filled: true,
                    ),
                  ),
                ),
              ),
            ),
            Container(
                        width: MediaQuery.of(context).size.width/1.3,
                        child: RaisedButton(
                          onPressed: (){
                            uploadFile();
                          },
                          color: Colors.indigo,
                          child: Text('Done',style: TextStyle(fontSize: 17.0,color: Colors.white),),
                        ),
                      )
                    ],
                  ),
    );
  }
 Future uploadFile() async {
   StorageReference storageReference = FirebaseStorage.instance
       .ref()
       .child('chats/${Path.basename(_imageFile.path)}}');
   StorageUploadTask uploadTask = storageReference.putFile(_imageFile);
   await uploadTask.onComplete;
    CircularProgressIndicator();

   storageReference.getDownloadURL().then((fileURL) {
       FirebaseFirestore.instance.collection(dec.text).doc().set({
         'imglink':fileURL,
         'title':title.text,
         'price':price.text

     });
   });
   Route route=MaterialPageRoute(builder: (context) => admin_home());
   Navigator.push(context, route);
  }
}
