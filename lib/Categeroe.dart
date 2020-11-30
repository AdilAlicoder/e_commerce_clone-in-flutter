import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/show_product.dart';
import 'package:flutter/material.dart';

import 'categerios_show.dart';

class categeroy extends StatefulWidget {
  @override
  _categeroyState createState() => _categeroyState();
}

class _categeroyState extends State<categeroy> {
  TextEditingController search_item=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categerios'),
      ),
      body: SingleChildScrollView(

        child: Container(
            child:Column(
              children: [
                search(),
                Bags(),
                Mobiles(),
                shoes(),
                toys(),
                headfone(),
                watchs(),
                shirts(),
              ],
            )
        ),
      ),
    );
  }
  Widget event({image, title, price, id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
        child:InkWell(
          onTap: (){
            Route route=MaterialPageRoute(builder: (context) => show_product('bags',image,title,price,id));
            Navigator.push(context, route);
          },
          child: Container(
            height: 80,
            width: 100,
            child:Image(
                  width: 80,
                  height: 80,
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
            ),
          ),
        ),
    );
  }
  Bags() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Bags',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600,color: Colors.cyan),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('bags').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return SizedBox(
                height: 135,
                  child: Card(
                    child: Container(
                      color: Colors.red,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data.documents
                            .map<Widget>((DocumentSnapshot document) {
                          return event(
                              image: document['imglink'],
                              title: document['title'],
                              price: document['price'],
                              id:document.id);
                        }).toList(),
                      ),
                    ),
                  ),
              );
            },
          ),
        ]
    );
  }
  headfone() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Headfones',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600,color: Colors.cyan),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('headfones').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return SizedBox(
                height: 135,
                child:Card(
                child: Container(
                  color: Colors.red,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.documents
                        .map<Widget>((DocumentSnapshot document) {
                      return headfones(
                          image: document['imglink'],
                          title: document['title'],
                          price: document['price'],
                          id:document.id);
                    }).toList(),
                  ),
                ),
                ),
              );
            },
          ),
        ]
    );
  }
  Widget headfones({image, price, title, id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:InkWell(
        onTap: (){
          Route route=MaterialPageRoute(builder: (context) => show_product('headfones',image,title,price,id));
          Navigator.push(context, route);
        },
        child: Container(
          height: 80,
          width: 100,
          child:Image(
                width: 80,
                height: 80,
                image: NetworkImage(image),
                fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  Mobiles() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Mobiles',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600,color: Colors.cyan),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('mobiles').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return SizedBox(
                height: 135,
                child: Card(
                  child: Container(
                    color: Colors.red,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data.documents
                          .map<Widget>((DocumentSnapshot document) {
                        return mobiles(
                            image: document['imglink'],
                            title: document['title'],
                            price: document['price'],
                            id:document.id);
                      }).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        ]
    );
  }
  Widget mobiles({image, title, price, id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:InkWell(
        onTap: (){
          Route route=MaterialPageRoute(builder: (context) => show_product('mobiles',image,title,price,id));
          Navigator.push(context, route);
        },
        child: Container(
          height: 80,
          width: 100,
          child:Image(
                width: 80,
                height: 80,
                image: NetworkImage(image),
                fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  shoes(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Shoes',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600,color: Colors.cyan),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('shoes').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return SizedBox(
                height: 135,
                child:Card(
                child: Container(
                  color: Colors.red,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.documents
                        .map<Widget>((DocumentSnapshot document) {
                      return shoeswidget(
                          image: document['imglink'],
                          title: document['title'],
                          price: document['price'],
                          id:document.id);
                    }).toList(),
                  ),
                ),
                ),
              );
            },
          ),
        ]
    );
  }

  shoeswidget({image, title, price, id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:InkWell(
        onTap: (){
          Route route=MaterialPageRoute(builder: (context) => show_product('shoes',image,title,price,id));
          Navigator.push(context, route);
        },
        child: Container(
          height: 80,
          width: 100,
          child:Image(
                width: 80,
                height: 80,
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
        ),
      ),
    );
  }

  watchs() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Watches',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600,color: Colors.cyan),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('watchs').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return SizedBox(
                height: 135,
                child: Card(
                  child: Container(
                    color: Colors.red,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data.documents
                          .map<Widget>((DocumentSnapshot document) {
                        return watchwidget(
                            image: document['imglink'],
                            title: document['title'],
                            price: document['price'],
                            id:document.id);
                      }).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        ]
    );
  }

  watchwidget({image, title, price, id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:InkWell(
        onTap: (){
          Route route=MaterialPageRoute(builder: (context) => show_product('watchs',image,title,price,id));
          Navigator.push(context, route);
        },
        child: Container(
          height: 80,
          width: 100,
          child:Image(
                width: 80,
                height: 80,
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
        ),
      ),
    );
  }

  shirts() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Shirts',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600,color: Colors.cyan),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('shirts').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return SizedBox(
                height: 135,
                child:Card(
                child: Container(
                  color: Colors.red,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.documents
                        .map<Widget>((DocumentSnapshot document) {
                      return shirtswidget(
                          image: document['imglink'],
                          title: document['title'],
                          price: document['price'],
                          id:document.id);
                    }).toList(),
                  ),
                ),
                ),
              );
            },
          ),
        ]
    );
  }

  shirtswidget({image, title, price, id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:InkWell(
        onTap: (){
          Route route=MaterialPageRoute(builder: (context) => show_product('shirts',image,title,price,id));
          Navigator.push(context, route);
        },
        child: Container(
          height: 80,
          width: 100,
          child:Image(
                width: 80,
                height: 80,
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
        ),
      ),
    );
  }

  search() {
    return Container(
      height: 70,
      color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width/1.1,
          color: Colors.white,
          height: 50.0,
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
                    Route route=MaterialPageRoute(builder: (context) => categerios_show('mobiles'));
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
                  Icons.search,
                ),
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

  toys() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Toys',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600,color: Colors.cyan),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('toys').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              return SizedBox(
                height: 135,
                child:Card(
                  child: Container(
                    color: Colors.red,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data.documents
                          .map<Widget>((DocumentSnapshot document) {
                        return toyswidget(
                            image: document['imglink'],
                            title: document['title'],
                            price: document['price'],
                            id:document.id);
                      }).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        ]
    );
  }

  toyswidget({image, title, price, String id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:InkWell(
        onTap: (){
          Route route=MaterialPageRoute(builder: (context) => show_product('toys',image,title,price,id));
          Navigator.push(context, route);
        },
        child: Container(
          height: 80,
          width: 100,
          child:Image(
            width: 80,
            height: 80,
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
