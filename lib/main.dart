
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'checkuser.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(e_comerce());
}
class e_comerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: checkuser(),
      ),
    );
  }
}
