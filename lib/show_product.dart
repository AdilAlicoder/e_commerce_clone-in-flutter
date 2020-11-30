import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/adrees.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class show_product extends StatefulWidget {
  final String image,title,price,id,d_name;
  show_product(this.d_name,this.image, this.title, this.price,this.id);

  @override
  _show_productState createState() => _show_productState(d_name,image,title,price,id);
}

class _show_productState extends State<show_product> {
  final String image,title,price,id,d_name;
  _show_productState(this.d_name,this.image,this.title, this.price,this.id);
  final databaseReference = Firestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/1,
              height: MediaQuery.of(context).size.height/2,
              child: Image(
                image: NetworkImage(image),
                height: MediaQuery.of(context).size.height/7,
                width: MediaQuery.of(context).size.width/1,
              ),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(title,style: TextStyle(fontSize: 18.0,color: Colors.blue,fontWeight:FontWeight.bold),),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text('Price',style: TextStyle(fontSize: 20.0),),
                  Padding(
                    padding:  EdgeInsets.only(left: 10.0),
                    child: Text(price,style: TextStyle(fontSize: 20.0,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('Satchel bags are large bags used for casual occasions. The bag part is a big loose sack connected to a long strap. The strap is usually worn on the shoulder and crossed over the body so the bag rests on the opposite hip. Women usually wear satchel bags, but its also acceptable for men to wear them',style: TextStyle(fontSize: 16.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width/1,

                  child: RaisedButton(
                    onPressed: (){
                      add_to_cart();
                    },
                    color: Colors.red,
                    child: Text('Buy Now',style: TextStyle(color: Colors.white),),
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
    );
  }

  void add_to_cart() {
    Route route=MaterialPageRoute(builder: (context) => adrees(image,title,price,'1','show_product'));
    Navigator.push(context, route);
  }
}
