import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Homepage.dart';
import 'Login.dart';
class checkuser extends StatefulWidget {
  @override
  _checkuserState createState() => _checkuserState();
}

class _checkuserState extends State<checkuser> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    geo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Future<void> geo() async {
    if (await FirebaseAuth.instance.currentUser != null) {
    Route route=MaterialPageRoute(builder: (context) => Homepage());
    Navigator.push(context, route);
    } else {
      Route route=MaterialPageRoute(builder: (context) => Log_in());
      Navigator.push(context, route);
    }
  }
}