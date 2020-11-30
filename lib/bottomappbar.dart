
import 'package:flutter/material.dart';

import 'Categeroe.dart';
import 'Homepage.dart';
import 'cart.dart';
import 'deals.dart';
import 'menu.dart';

class bottomappbar extends StatefulWidget {
  @override
  _bottomappbarState createState() => _bottomappbarState();
}

class _bottomappbarState extends State<bottomappbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 3.0,
      child: Container(
        height: 65.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(
                      Icons.home
                  ),
                  onPressed: (){
                    Route route=MaterialPageRoute(builder: (context) => Homepage());
                    Navigator.push(context, route);
                  },
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 5.0),
                  child: Text('Home',),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(
                      Icons.category
                  ),
                  onPressed: (){
                    Route route=MaterialPageRoute(builder: (context) => categeroy());
                    Navigator.push(context, route);
                  },
                ),
                Text('Categerios')
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top:8.0),
                  child: InkWell(
                    onTap: (){
                      Route route=MaterialPageRoute(builder: (context) => deals());
                      Navigator.push(context, route);
                    },
                    child: Image(
                      image: AssetImage('images/deals.png'),
                      width: 32,
                      height: 40,
                    ),
                  ),
                ),
                Text('Deals')
              ],
            ),
            Column(
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(
                      Icons.shopping_cart
                  ),
                  onPressed: (){
                    Route route=MaterialPageRoute(builder: (context) => cart());
                    Navigator.push(context, route);
                  },
                ),
                Text('Cart'),
              ],
            ),
            Column(
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(
                      Icons.menu
                  ),
                  onPressed: (){
                    Route route=MaterialPageRoute(builder: (context) => menu());
                    Navigator.push(context, route);
                  },
                ),
                Text('Menu')
              ],
            ),
          ],
        ),
      ),
    );
  }
}