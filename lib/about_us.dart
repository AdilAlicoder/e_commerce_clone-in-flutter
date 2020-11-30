import 'package:flutter/material.dart';
class about_us extends StatefulWidget {
  @override
  _about_usState createState() => _about_usState();
}

class _about_usState extends State<about_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('About Shopping Al Futtaim Retail ',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 7.0),
                child: Text('An About Us page can be one of the most important pages on your website but it is one of the most overlooked elements on your website normally. About Us pages can highlight why you created your business, your commitment to sustainability, or you can tell the story of how your business came to be. As an important part of your website your About Us page can set you apart from your competitors in a way that can build your brand in a positive way.',style: TextStyle(fontSize: 16.0),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 5.0),
                child: Text('What Are About Us Pages ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 7.0),
                child: Text('An About Us Page is a page on your website that tells your readers all about you. It includes a detailed description covering all aspects of your business and you as entrepreneurs. This can include the products or services you are offering, how you came into being as a business, your mission and vision, your aim, and maybe something about your future goals too. Your About Us page is your perfect opportunity to tell a compelling story about your business.',style: TextStyle(fontSize: 16.0),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 5.0),
                child: Text('Team Member Profiles ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 7.0),
                child: Text('Add an emotional element to your About Us page by adding details of the people that are driving the passion at your business. People find it easier to connect with human beings, so allow the personality of your crew to shine through the About Us page.',style: TextStyle(fontSize: 16.0),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
