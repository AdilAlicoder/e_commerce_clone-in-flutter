import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class categeroy extends StatefulWidget {
  @override
  _categeroyState createState() => _categeroyState();
}

class _categeroyState extends State<categeroy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categerios'),
      ),
      body: Container(
        child:Column(
          children: [
            Bags()
          ],
        )
      ),
    );
  }
  Widget event({image}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child:Container(
          height: 280,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Image(
                  width: 80,
                  height: 80,
                  image: NetworkImage(image),
                ),
            ],
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
              child: Text('Bags',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600),),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('bags').snapshots(),
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
                          image: document['imglink']);
                    }).toList(),
                  ),
                );
              },
            ),
          ]
      );
    }
  headfonesairpods() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Headfones',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('headfones').snapshots(),
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
                        image: document['imglink']);
                  }).toList(),
                ),
              );
            },
          ),
        ]
    );
  }
  Widget headfones({image}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child:Container(
          height: 280,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Image(
                  width: 80,
                  height: 80,
                  image: NetworkImage(image),
                ),
            ],
          ),
        ),
      ),
    );
  }
  specialoffermobiles() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(' Mobiles',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w600),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('mobiles').snapshots(),
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
                        image: document['imglink']);
                  }).toList(),
                ),
              );
            },
          ),
        ]
    );
  }
  Widget mobiles({image}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child:Container(
          height: 280,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Image(
                  width: 80,
                  height: 80,
                  image: NetworkImage(image),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
