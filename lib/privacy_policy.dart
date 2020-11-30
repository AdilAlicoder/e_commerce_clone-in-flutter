import 'package:flutter/material.dart';
class privacy_policy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0,left: 5.0),
                child: Text('Creating a Privacy Policy for Ecommerce Stores',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 7.0),
                child: Text('Your Privacy Policy must be written specifically for current rules and regulations in force everywhere your customers reside, whether or not you or your business or commerce store is physically located in those jurisdictions.',style: TextStyle(fontSize: 16.0),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 5.0),
                child: Text('What is a Privacy Policy for Ecommerce Stores? ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 7.0),
                child: Text('This includes information you collect directly, such as through opt-in forms and your shopping cart checkout page, and indirectly such as by monitoring browser clicks, time spent on a page, interaction with ads, etc.', style: TextStyle(fontSize: 16.0),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 5.0),
                child: Text('What Should a Privacy Policy for Ecommerce Stores Include?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 7.0),
                child: Text('The United States and most governments worldwide require ecommerce websites and certain mobile apps to clearly display a comprehensive Privacy Policy. The sensitive nature of personal information collected to manage an ecommerce site warrants particular attention to this issue.', style: TextStyle(fontSize: 16.0),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
