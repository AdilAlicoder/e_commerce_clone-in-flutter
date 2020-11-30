import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/show_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter/material.dart';

import 'adrees.dart';
class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  String imglink,title,price;
  final databaseReference = Firestore.instance;
  String uid;
  var fb;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final db=FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User user=auth.currentUser;
    setState(() {
      uid=user.uid;
      fb=Firestore.instance.collection('cart').doc(uid);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'),
      backgroundColor: Colors.orange,),
      body:  Column(
        children: [
          search(),
          Bags(),
          cart_show(),
        ],
      ),
      floatingActionButton: Container(
        width: 100,
        height: 50,
        child: FloatingActionButton(
          onPressed: (){
            Route route=MaterialPageRoute(builder: (context) => adrees('weas','geo','jje','we','cart'));
            Navigator.push(context, route);
          },
          backgroundColor: Colors.red,
            child: Center(child: Text('Check out',style: TextStyle(fontSize: 17.0),)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
        ),
      ),
    );
  }

  Widget ui({image, title, price, id, cartcount}) {
   return SizedBox(
     height: 120,
     child: Row(
       children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: InkWell(
             onTap: (){
               Route route=MaterialPageRoute(builder: (context) => show_product('geo',image,title,price,id));
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
             Route route=MaterialPageRoute(builder: (context) => show_product('geo',image,title,price,id));
             Navigator.push(context, route);
           },
           child: Container(
             width: MediaQuery.of(context).size.width/1.7,
               height: 75,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(title,style: TextStyle(fontSize: 15.0,),softWrap: false,maxLines: 1,overflow: TextOverflow.ellipsis,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Padding(
                         padding:  EdgeInsets.only(top: 22.0),
                         child: Text(price,style: TextStyle(fontSize: 17.0,color: Colors.red),),
                       ),
                       Row(

                         children: [
                           Padding(
                             padding:  EdgeInsets.only(top: 22.0,right: 16.0),
                             child: Container(
                               width: 38,
                               height: 25,
                               child: RaisedButton(
                                 color: Colors.yellow,
                                 onPressed: (){
                                   db.collection('cart').doc(uid).collection('items').doc(id).get().then((DocumentSnapshot snap){
                                     String a=snap.get('cartcount');
                                     int cart_count=int.parse(a)-1;
                                     print(cart_count);
                                     db.collection('cart').doc(uid).collection('items').doc(id).update({
                                       'cartcount':cart_count.toString()
                                     });
                                   });
                                 },
                                 child: Text('−',style: TextStyle(fontSize: 20.0,color: Colors.black),),
                                 ),
                             ),
                           ),
                           Padding(
                             padding:  EdgeInsets.only(top: 22.0,right: 16.0),
                             child: Text(cartcount,style: TextStyle(fontSize: 15.0,),),
                           ),
                           Padding(
                             padding:  EdgeInsets.only(top: 22.0),
                             child: Container(
                               width: 40,
                               height: 25,
                               child: RaisedButton(
                                 color: Colors.deepOrange,
                                 onPressed: (){
                                   db.collection('cart').doc(uid).collection('items').doc(id).get().then((DocumentSnapshot snap){
                                     String a=snap.get('cartcount');
                                     int cart_count=int.parse(a)+1;
                                     print(cart_count);
                                    db.collection('cart').doc(uid).collection('items').doc(id).update({
                                      'cartcount':cart_count.toString()
                                     });
                                   });
                                 },
                                 child: Center(
                                   child: Text('+',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       )
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
  Bags() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Suggested items',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600,color: Colors.blue),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('bags').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return SizedBox(
                height: 80,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.documents
                        .map<Widget>((DocumentSnapshot document) {
                      return event(
                          image: document['imglink'],
                          title:document['title'],
                          price:document['price'],
                          id:document.id);
                    }).toList(),
                ),
              );
            },
          ),
        ]
    );
  }
  Widget event({image, title, price, id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:InkWell(
        onTap: (){
          final User user=auth.currentUser;
          final uid=user.uid;
          databaseReference.collection("bags").doc(id).get().then((DocumentSnapshot snap){
            databaseReference.collection("cart").doc(uid).collection("items").doc().set({
              'imglink': snap.get('imglink'),
              'title' : snap.get('title'),
              'price' : snap.get('price'),
              'cartcount':'1'
            });
          });
        },
        child: Card(
          child: Container(
            height: 72,
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                     Image(
                      image: NetworkImage(image),
                      width: 100,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 38.0),
                      child: Center(child: Text('Add to Cart',style: TextStyle(color: Colors.blue,fontSize: 15.0,fontWeight: FontWeight.bold),)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  search() {
    return   Container(
      height: 70,
      color: Colors.orange,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width/1.1,
          color: Colors.white,
          height: 50.0,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search for items",
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
  cart_show() {
    return StreamBuilder<QuerySnapshot>(
      stream: fb.collection("items").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        }
        return Expanded(
          child: Padding(
            padding:  EdgeInsets.only(top: 23.0),
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
}
