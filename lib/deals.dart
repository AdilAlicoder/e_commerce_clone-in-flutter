import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/show_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'categerios_show.dart';

class deals extends StatefulWidget {
  @override
  _dealsState createState() => _dealsState();
}

class _dealsState extends State<deals> {
  final databaseReference = Firestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController search_item=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deals'),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              search(),
              dealsimg(),
              bagsdeals(),
              headfonesairpods(),
              specialoffermobiles(),
            ],
          ),
        ),
      ),
    );
  }
  bagsdeals() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Shirt Deals',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600,color: Colors.blue),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('shirts').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return SizedBox(
                height: 290,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data.documents
                      .map<Widget>((DocumentSnapshot document) {
                    return event(
                        image: document['imglink'],
                        title: document['title'],
                        price: document['price'],
                        id: document.id);
                  }).toList(),
                ),
              );
            },
          ),
        ]
    );
  }
  Widget event({image, title, price,id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Route route=MaterialPageRoute(builder: (context) => show_product('shirts',image,title,price,id));
          Navigator.push(context, route);
        },
        child: Card(
          child:Container(
            height: 280,
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                ),
                Center(
                  child: Image(
                    width: 80,
                    height: 80,
                    image: NetworkImage(image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title,style: TextStyle(fontSize: 17.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(price,style: TextStyle(color: Colors.green,fontSize:19.0),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 135,
                      child: RaisedButton(
                        onPressed: (){
                          bags(id);
                        },
                        color: Colors.red,
                        child: Text('ADD TO CART',style: TextStyle(color: Colors.white),),
                        splashColor: Colors.blue,
                        elevation: 3.0,
                        highlightColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void bags(id) {
    final User user=auth.currentUser;
    final uid=user.uid;
    databaseReference.collection("bags").doc(id).get().then((DocumentSnapshot snap){
      databaseReference.collection("cart").doc(uid).collection("items").doc().set({
        'imglink': snap.get('imglink'),
        'title' : snap.get('title'),
        'price' : snap.get('price'),
        'cartcount' :'1',
      });
    });
  }
  headfonesairpods() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Shoes Deals',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600,color: Colors.blue),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('shoes').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return SizedBox(
                height: 290,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data.documents
                      .map<Widget>((DocumentSnapshot document) {
                    return headfones(
                        image: document['imglink'],
                        title: document['title'],
                        price: document['price'],
                        id: document.id);
                  }).toList(),
                ),
              );
            },
          ),
        ]
    );
  }
  specialoffermobiles() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Special offers Watches',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600,color: Colors.blue),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('watchs').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return SizedBox(
                height: 290,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data.documents
                      .map<Widget>((DocumentSnapshot document) {
                    return mobiles(
                        image: document['imglink'],
                        title: document['title'],
                        price: document['price'],
                        id: document.id);
                  }).toList(),
                ),
              );
            },
          ),
        ]
    );
  }
  Widget headfones({image, title, price,id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Route route=MaterialPageRoute(builder: (context) => show_product('shoes',image,title,price,id));
          Navigator.push(context, route);
        },
        child: Card(
          child:Container(
            height: 280,
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                ),
                Center(
                  child: Image(
                    width: 80,
                    height: 80,
                    image: NetworkImage(image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title,style: TextStyle(fontSize: 17.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(price,style: TextStyle(color: Colors.green,fontSize:19.0),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 135,
                      child: RaisedButton(
                        onPressed: (){
                          Headfone(id);
                        },
                        color: Colors.red,
                        child: Text('ADD TO CART',style: TextStyle(color: Colors.white),),
                        splashColor: Colors.blue,
                        elevation: 3.0,
                        highlightColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget mobiles({image, title, price,id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Route route=MaterialPageRoute(builder: (context) => show_product('watchs',image,title,price,id));
          Navigator.push(context, route);
        },
        child: Card(
          child:Container(
            height: 280,
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                ),
                Center(
                  child: Image(
                    width: 80,
                    height: 80,
                    image: NetworkImage(image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title,style: TextStyle(fontSize: 17.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(price,style: TextStyle(color: Colors.green,fontSize:19.0),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 135,
                      child: RaisedButton(
                        onPressed: (){
                          mobile(id);
                        },
                        color: Colors.red,
                        child: Text('ADD TO CART',style: TextStyle(color: Colors.white),),
                        splashColor: Colors.blue,
                        elevation: 3.0,
                        highlightColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void Headfone(id) {
    final User user=auth.currentUser;
    final uid=user.uid;
    databaseReference.collection("headfones").doc(id).get().then((DocumentSnapshot snap){
      databaseReference.collection("cart").doc(uid).collection("items").doc().set({
        'imglink': snap.get('imglink'),
        'title' : snap.get('title'),
        'price' : snap.get('price'),
        'cartcount' : '1'
      });
    });
  }
  void mobile(id) {
    final User user=auth.currentUser;
    final uid=user.uid;
    databaseReference.collection("mobiles").doc(id).get().then((DocumentSnapshot snap){
      databaseReference.collection("cart").doc(uid).collection("items").doc().set({
        'imglink': snap.get('imglink'),
        'title' : snap.get('title'),
        'price' : snap.get('price'),
        'cartcount':'1'
      });
    });
  }
  search() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.cyan,
        width: MediaQuery.of(context).size.width/1.1,
        height: MediaQuery.of(context).size.height/12,
        child: TextFormField(
          validator: (String value){
            if(value.isEmpty){
              return 'Please Enter item';
            }
            return null;
          },
          controller: search_item,
          decoration: InputDecoration(
            hintText: "Search for items",
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: (){
                String item=search_item.text;
                if(item=='bags'||item=='Bags'||item=='Bag'||item=='bag'){
                  Route route=MaterialPageRoute(builder: (context) => categerios_show('bags'));
                  Navigator.push(context, route);
                }
                else if(item=='shoes'||item=='Shoes'){
                  Route route=MaterialPageRoute(builder: (context) => categerios_show('shoes'));
                  Navigator.push(context, route);
                }
                else if(item=='toys'||item=='Toys'||item=='toy'||item=='Toy'){
                  Route route=MaterialPageRoute(builder: (context) => categerios_show('toys'));
                  Navigator.push(context, route);
                }
                else if(item=='watchs'||item=='Watchs'){
                  Route route=MaterialPageRoute(builder: (context) => categerios_show('watchs'));
                  Navigator.push(context, route);
                }
                else if(item=='shoes'||item=='Shoes'){
                  Route route=MaterialPageRoute(builder: (context) => categerios_show('shoes'));
                  Navigator.push(context, route);
                }
                else if(item=='shirts'||item=='Shirts'){
                  Route route=MaterialPageRoute(builder: (context) => categerios_show('shirts'));
                  Navigator.push(context, route);
                }
                else if(item=='mobiles'||item=='Mobiles'||item=='mobile'||item=='Mobile'){
                  Route route=MaterialPageRoute(builder: (context) => categerios_show('toys'));
                  Navigator.push(context, route);
                }
                else if(item=='Headfone'||item=='Headfones'||item=='headfone'||item=='Headfone'){
                  Route route=MaterialPageRoute(builder: (context) => categerios_show('headfones'));
                  Navigator.push(context, route);
                }
                else{
                  print('not data');
                }
              },
              icon: Icon(
                  Icons.search
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
  dealsimg() {
    return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width/1.1,
              height: MediaQuery.of(context).size.height/6,
              child: Image(
                image: NetworkImage('https://www.nicepng.com/png/full/372-3720969_e-ul-adha-shopping-deals-2017-and-discounts.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width/1.1,
              height: MediaQuery.of(context).size.height/6,
              child: Image(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiP8J-EIORXoBg9rap8DI1edwxBmLZixj8rw&usqp=CAU '),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width/1.1,
              height: MediaQuery.of(context).size.height/6,
              child: Image(
                image: NetworkImage('https://pisces.bbystatic.com/image2/BestBuy_US/Gallery/GL-37400-pol-dotd-190823_der-98962.png;maxHeight=280;maxWidth=412'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
