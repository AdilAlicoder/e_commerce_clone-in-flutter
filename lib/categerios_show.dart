import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/show_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';
class categerios_show extends StatefulWidget {
  final String text;
  categerios_show(this.text);
  @override
  _categerios_showState createState() => _categerios_showState(text);
}

class _categerios_showState extends State<categerios_show> {
  FirebaseAuth auth=FirebaseAuth.instance;
  final databaseReference=FirebaseFirestore.instance;
  final String text;
  _categerios_showState(this.text);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('categerios_show'),
      ),
      body: Column(
        children: [
        Search(),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection(text).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return Expanded(
                child: ListView(
                    shrinkWrap: true,
                    children: snapshot.data.documents
                        .map<Widget>((DocumentSnapshot document) {
                      return ui(
                          image: document['imglink'],
                          price: document['price'],
                          title: document['title'],
                          id: document.id);
                        //  des: document['description']);
                    }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget ui({image, price, title, id}) {
    return Column(
      children: [
          Row(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0 ),
                    child: InkWell(
                      onTap: (){
                        Route route=MaterialPageRoute(builder: (context) => show_product(text,image,title,price,id));
                        Navigator.push(context, route);
                      },
                      child: GFAvatar(
                        backgroundImage: NetworkImage(image),
                        shape: GFAvatarShape.standard,
                        radius: 50.0,
                      ),
                    ),
                  ),
                ),

                     Padding(
                       padding: EdgeInsets.only(top:24.0),
                       child: InkWell(
                         onTap: (){
                           Route route=MaterialPageRoute(builder: (context) => show_product(text,image,title,price,id));
                           Navigator.push(context, route);
                         },
                         child: Container(
                            height:  150.0,
                            width: MediaQuery.of(context).size.width/1.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(title,style: TextStyle(fontSize: 15.0),maxLines:2, overflow: TextOverflow.ellipsis,
                                    softWrap: true,),
                                ),
                                Row(
                                    children: [
                                      Container(
                                      height: 45.0,
                                      width: 38.0,
                                      color: Colors.green,
                                      child: Center(
                                      child: Text('50% off',style: TextStyle(fontSize: 17.0,color: Colors.white),),
                                      ),
                                   ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 7.0),
                                          child: Text('Original price',style: TextStyle(color: Colors.grey,fontSize: 17.0),),
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: Text(price,style: TextStyle(fontSize: 15.0,color: Colors.green,),),
                                      ),
                                    ],
                                  ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0,left: 32.0),
                                  child: Container(
                                  width: 135,
                               child: RaisedButton(
                                   onPressed: (){
                                     addtocart(id);
                                  },
                                      color: Colors.red,
                                      child: Text('ADD TO CART',style: TextStyle(color: Colors.white),),
                                       splashColor: Colors.blue,
                                         elevation: 3.0,
                                       highlightColor: Colors.white,
                             ),
                  ),
                                ),
                              ],
                            ),
                          ),
                       ),
                     ),

                  ],
                ),
        SizedBox(height: 56.0),
      ],
    );
  }

  void addtocart(id) {
    final User user=auth.currentUser;
    final uid=user.uid;
    databaseReference.collection(text).doc(id).get().then((DocumentSnapshot snap){
      databaseReference.collection("cart").doc(uid).collection("items").doc().set({
        'imglink': snap.get('imglink'),
        'title' : snap.get('title'),
        'price' : snap.get('price'),
        'cartcount' : '1',
      });
    });
  }

  Search() {
    return   Container(
      height: 70,
      color: Colors.red,
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
}
