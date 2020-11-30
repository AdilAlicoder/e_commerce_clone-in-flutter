import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';
class place_order extends StatefulWidget {
  final String name, number, street, adrees,city;
  place_order(this.name,this.number, this.street, this.adrees, this.city);

  @override
  _place_orderState createState() => _place_orderState(name,number,street,adrees,city);
}

class _place_orderState extends State<place_order> {
  final fb = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid;
  String finalDate = '';
  final String name, number, street, adrees,city;
  _place_orderState(this.name,this.number, this.street, this.adrees, this.city);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User user = auth.currentUser;
      var date = new DateTime.now().toString();
      var dateParse = DateTime.parse(date);
      var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
      setState(() {
        uid = user.uid;
        finalDate = formattedDate.toString() ;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('place order'),
      ),
      body:Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                child: Image(
                  image: AssetImage('images/order.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                   save_data();
                  Route route=MaterialPageRoute(builder: (context)=>Homepage());
                  Navigator.push(context, route);
                  },
                  child: Center(child: Text('Place order',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),)),
                ),
              ),
            ),
           // cart_show()
          ],
      ),
    );
  }
  void save_data() {
    fb.collection("cart").doc(uid).collection('items').get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        fb.collection('orders').doc(uid).collection('order').doc().set({
          'imglink':result.get('imglink'),
          'price':result.get('price'),
          'title':result.get('title'),
          'cartcount':result.get('cartcount'),
          'Name':name,
          'Adrees':adrees,
          'City':city,
          'Street':street,
          'Number':number,
          'Date':finalDate
        });
        fb.collection('adminorders').doc().set({
          'imglink':result.get('imglink'),
          'price':result.get('price'),
          'title':result.get('title'),
          'cartcount':result.get('cartcount'),
          'Name':name,
          'Adrees':adrees,
          'City':city,
          'Street':street,
          'Number':number,
          'Date':finalDate
        });
      });
    });
  }
}

