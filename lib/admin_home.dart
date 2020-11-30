import 'package:e_commerce/Login.dart';
import 'package:e_commerce/admin_order.dart';
import 'package:e_commerce/myorder.dart';
import 'package:flutter/material.dart';

import 'add_product.dart';

class admin_home extends StatefulWidget {
  @override
  _admin_homeState createState() => _admin_homeState();
}

class _admin_homeState extends State<admin_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.add_shopping_cart,size: 35,),
            onPressed: (){
              Route route=MaterialPageRoute(builder: (context) => admin_order());
              Navigator.push(context, route);
            },
          ),
        actions: <Widget>[
         Padding(
           padding: const EdgeInsets.all(18.0),
           child: InkWell(
             onTap: (){
               Route route=MaterialPageRoute(builder: (context) => Log_in());
               Navigator.push(context, route);
             },
               child: Text('Logout',style: TextStyle(fontSize: 16.0),)),
         )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
                Icons.shop,
                color: Colors.white,
                size: 220.0,
              ),
            Container(
              width: MediaQuery.of(context).size.width/2.5,
              child: RaisedButton(
                color: Colors.orange,
                onPressed: (){
                  Route route=MaterialPageRoute(builder: (context) => add_product());
                  Navigator.push(context, route);
                },
                child: Center(child: Text('Add new item')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
