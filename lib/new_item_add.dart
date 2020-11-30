import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class new_item_add extends StatefulWidget {
  final String uploadedFileURL;
  new_item_add(this.uploadedFileURL);

  @override
  _new_item_addState createState() => _new_item_addState(uploadedFileURL);
}

class _new_item_addState extends State<new_item_add> {
  final String uploadedFileURL;
  TextEditingController title=new TextEditingController();
  TextEditingController price=new TextEditingController();
  TextEditingController dec=new TextEditingController();
  _new_item_addState(this.uploadedFileURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add item'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4,
              child: Image(
                image: NetworkImage('https://assets.ajio.com/medias/sys_master/root/h5a/h59/13018715881502/-1117Wx1400H-460342492-blue-MODEL.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
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
          Padding(
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
          Padding(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width/1.5,
              child: RaisedButton(
                onPressed: (){
                  print(uploadedFileURL);
                  FirebaseFirestore.instance.collection(dec.text).doc().set({
                    'imglink':uploadedFileURL,
                    'title':title.text,
                    'price':price.text
                  });
                },
                elevation: 5.0,
                splashColor: Colors.white,
                color: Colors.orange,
                child: Center(child: Text('Done',style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold),)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
