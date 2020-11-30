import 'package:flutter/material.dart';
class terms_condition extends StatefulWidget {
  @override
  _terms_conditionState createState() => _terms_conditionState();
}

class _terms_conditionState extends State<terms_condition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
      ),
      body:SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0,left: 5.0),
                child: Text('Terms and Conditions for Ecommerce Stores',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 7.0),
                child: Text('Most websites have a link to a Terms and Conditions agreement that users and customers agree to in order to use the site. Ecommerce stores are no different. Nearly every ecommerce store has a link to a custom Terms and Conditions agreement posted in the site footer or some other conspicuous location such as a registration or checkout page.', style: TextStyle(fontSize: 16.0),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 5.0),
                child: Text('Why Do Ecommerce Stores Need a Terms and Conditions Agreement? ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 7.0),
                child: Text('A good Terms and Conditions agreement allows you to legally define and enforce the rules your customers must follow to interact with and make purchases from your online store. In addition to this, the Terms and Conditions agreement also gives you a platform to limit your liability in case a product you sell is faulty, and to define what happens in the event of a customer dispute.', style: TextStyle(fontSize: 16.0),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 5.0),
                child: Text('Intellectual Property/Trademarks',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 7.0),
                child: Text('Lets look at this example from the Intellectual Property Software and Content clause of the ASOS Terms and Conditions. This clause states that the software and content available through the website belongs to ASOS or its licensors and is protected by copyright laws. It goes on to explain what customers can and cannot do with the content or software.', style: TextStyle(fontSize: 16.0),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
