import 'package:flutter/material.dart';

import 'admin_home.dart';
class admin_login extends StatefulWidget {
  @override
  _admin_loginState createState() => _admin_loginState();
}

class _admin_loginState extends State<admin_login> {
  bool _obsuretext = true;
  final _key = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Form(
        key: _key,
        child: Stack(
          children: [
            Container(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/loginback.jpg'),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 70.0),
                    child: Center(
                      child: Image(
                        height: 200,
                        width: 300,
                        image: AssetImage('images/avatar.png'),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Card(
                        color: Colors.orange,
                        elevation: 60.0,
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 1.1,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 2,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 33.0, left: 10.0),
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.2,
                              child: TextFormField(
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Email';
                                  }
                                  return null;
                                },
                                controller: email,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  prefixIcon: Icon(Icons.email),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.deepOrange,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 10.0),
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.2,
                              child: TextFormField(
                                obscureText: _obsuretext,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                  return null;
                                },
                                controller: password,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obsuretext = !_obsuretext;
                                      });
                                    },
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.deepOrange,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 180.0, top: 5.0),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.1,
                            child: Text('Forgot Password?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: RaisedButton(
                              elevation: 35.0,
                              onPressed: () {
                                loginuser();
                              },
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 100.0),
                              color: Colors.green[800],
                              splashColor: Colors.amber,
                              child: Text("Log in",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                            ),
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
    );
  }

  Future<void> loginuser() async {
    if (_key.currentState.validate()) {
      String Email=email.text;
      String pass=password.text;
      if(Email=='adiladmin@gmail.com'&&pass=='adminadmin1122'){
        Route route=MaterialPageRoute(builder: (context)=> admin_home());
        Navigator.push(context, route);
      }
      else{
        print('increect');
      }
    }
  }
}
