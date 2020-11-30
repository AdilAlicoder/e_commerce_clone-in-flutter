import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';
class shipping_datails extends StatefulWidget {
  final String image, title, price, cartcount, id, name, adrees, city, street, number, date,button,order,uid;
  shipping_datails(this.image, this.title, this.price, this.cartcount, this.id, this.name, this.adrees, this.city, this.street, this.number, this.date,this.button,this.order,this.uid);

  @override
  _shipping_datailsState createState() => _shipping_datailsState(image, title, price, cartcount, id, name, adrees, city, street, number, date,button,order,uid);
}

class _shipping_datailsState extends State<shipping_datails> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String image, title, price, cartcount, id, name, adrees, city, street, number, date,button,order,uid;
  
  _shipping_datailsState(this.image, this.title, this.price, this.cartcount, this.id, this.name, this.adrees, this.city, this.street, this.number, this.date,this.button,this.order,this.uid);
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Order'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left:8.0,top: 5.0),
                child: Text(price,style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),)),
          Padding(
            padding: EdgeInsets.only(left:8.0,top: 5.0),
            child: Text('Order ID :',style: TextStyle(fontSize: 17.0),),
              ),
              Padding(
                padding: EdgeInsets.only(left:8.0,top: 5.0),
                child: Text(id,style: TextStyle(fontSize: 17.0),),
              ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Date : ',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Center(child: Text(date,style: TextStyle(fontSize: 17.0,color: Colors.grey),)),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Center(
                  child: Card(
                    child: Container(
                      height: MediaQuery.of(context).size.height/6,
                      width: MediaQuery.of(context).size.width/1.1,
                      color: Colors.lime,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GFAvatar(
                              backgroundImage: NetworkImage(image),
                              radius: 35.0,
                              shape:GFAvatarShape.square ,
                            ),
                          ),
                          Container(
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 40.0,left: 8.0),
                child: Text('Shipping Details',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),)),
                Padding(
                  padding:  EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Name',style: TextStyle(fontSize: 16.0),),
                    Text(name,style: TextStyle(fontSize: 16.0),),
                  ],
              ),
                ),
              Padding(
                padding:  EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Number',style: TextStyle(fontSize: 16.0),),
                    Text(number,style: TextStyle(fontSize: 16.0),),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Street',style: TextStyle(fontSize: 16.0),),
                       Text(street,style: TextStyle(fontSize: 16.0),),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('City',style: TextStyle(fontSize: 16.0),),
                     Text(city,style: TextStyle(fontSize: 16.0),),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Adress',style: TextStyle(fontSize: 16.0),),
                    Text(adrees,style: TextStyle(fontSize: 16.0),),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: RaisedButton(
                    color: Colors.orange,
                    onPressed: (){
                      deletdata();
                    },
                    child: Text(button,style: TextStyle(fontSize: 17.0),),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  void deletdata() {
    if(order=='adminorder'){
      FirebaseFirestore.instance.collection('adminorders').doc(id).delete();
    }
    else if(order=='order'){
      FirebaseFirestore.instance.collection('orders').doc(uid).collection('order').doc(id).delete();
    }
  }
}
