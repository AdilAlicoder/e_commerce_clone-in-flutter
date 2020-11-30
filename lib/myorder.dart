import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/shipping_datails.dart';
import 'package:e_commerce/show_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter/material.dart';
import 'adrees.dart';
class myorder extends StatefulWidget {
  @override
  _myorderState createState() => _myorderState();
}

class _myorderState extends State<myorder> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final db=FirebaseFirestore.instance;
  String uid;
  String data;
  @override
  void initState() {
    User user=auth.currentUser;
          setState(() {
            uid=user.uid;
          });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: Text('My Order'),
        )),
      body:Column(
        children: [
          cart_show(),
        ],
      ),
    );
  }
  cart_show() {
    return StreamBuilder<QuerySnapshot>(
      stream: db.collection('orders').doc(uid).collection('order').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        }
        return Expanded(
          child: Padding(
              padding:  EdgeInsets.only(top: 23.0,left: 14.0),
              child: Container(
                width: MediaQuery.of(context).size.width/1.1,
                child: Card(
                  child: ListView(
                    shrinkWrap: true,
                    children: snapshot.data.documents
                        .map<Widget>((DocumentSnapshot document) {
                      return ui(
                          image: document['imglink'],
                          title: document['title'],
                          price: document['price'],
                          cartcount:document['cartcount'],
                          Name:document['Name'],
                          Adrees:document['Adrees'],
                          City:document['City'],
                          Street:document['Street'],
                          Number:document['Number'],
                          Date:document['Date'],
                          id: document.id);
                    }).toList(),
                  ),
                ),
            ),
          ),
        );
      },
    );
  }
  Widget ui({image, title, price,cartcount,id, Name, Adrees, City, Street, Number, Date}) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Route route=MaterialPageRoute(builder: (context) => shipping_datails(image, title, price,cartcount,id, Name, Adrees, City, Street, Number, Date,'Recive Order','order',uid));
                Navigator.push(context, route);
              },
              child: GFAvatar(
                backgroundImage: NetworkImage(image),
                radius: 35.0,
                shape:GFAvatarShape.square ,
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Route route=MaterialPageRoute(builder: (context) => shipping_datails(image, title, price,cartcount,id, Name, Adrees, City, Street, Number, Date,'Recive Order','order',uid));
              Navigator.push(context, route);
            },
            child: Container(
              width: MediaQuery.of(context).size.width/1.7,
              height: 64,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(fontSize: 15.0,),softWrap: false,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 22.0),
                        child: Text(price,style: TextStyle(fontSize: 17.0,color: Colors.blue),),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 22.0),
                            child: Text(cartcount,style: TextStyle(fontSize: 15.0,),),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 18.0),
                            child: Text('piece',style: TextStyle(fontSize: 15.0,),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
