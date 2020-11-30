import 'package:e_commerce/Login.dart';
import 'package:e_commerce/privacy_policy.dart';
import 'package:e_commerce/terms_condition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';

import 'about_us.dart';
import 'myorder.dart';
class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu bar'),
      ),
      body: Column(
        children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width/1,
                height: MediaQuery.of(context).size.height/4,
                child: Image(
                  image: NetworkImage('https://img.freepik.com/free-photo/product-package-boxes-shopping-bag-cart-with-laptop-online-shopping-delivery-concept_38716-138.jpg?size=626&ext=jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: MediaQuery.of(context).size.height/12,
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.gps_fixed,
                ),
                title: Text("Country",style: TextStyle(fontWeight: FontWeight.w600),),
                trailing: Text('Pakistan (English)',style: TextStyle(color: Colors.grey),),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 13.0),
            child: Card(
              child: Container(
                height: MediaQuery.of(context).size.height/3.3,
                width: MediaQuery.of(context).size.width/1.2,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: (){
                              Route route=MaterialPageRoute(builder: (context) => myorder());
                              Navigator.push(context, route);
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.menu,
                              ),
                              title: Text("My Order",style: TextStyle(fontWeight: FontWeight.w600),),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.contacts,
                            ),
                            title: Text("Contacts Us",style: TextStyle(fontWeight: FontWeight.w600),),
                          ),
                          InkWell(
                            onTap: (){
                              Route route=MaterialPageRoute(builder: (context) => about_us());
                              Navigator.push(context, route);
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.add_circle,
                              ),
                              title: Text("About us",style: TextStyle(fontWeight: FontWeight.w600),),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Route route=MaterialPageRoute(builder: (context) => terms_condition());
                              Navigator.push(context, route);
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.menu,
                              ),
                              title: Text("Terms & Conditions",style: TextStyle(fontWeight: FontWeight.w600),),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Route route=MaterialPageRoute(builder: (context) => privacy_policy());
                              Navigator.push(context, route);
                            },
                            child: ListTile(

                              leading: Icon(
                                Icons.lock_open,

                              ),
                              title: Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.w600),),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              FirebaseAuth.instance.signOut();
                              Route route=MaterialPageRoute(builder: (context) => Log_in());
                              Navigator.push(context, route);
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.lock_open,
                              ),
                              title: Text("Log out",style: TextStyle(fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:  EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Text(
                        'Version 14.5.1 (167)',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text('2020 A Carrefour All Right Reserved',style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
