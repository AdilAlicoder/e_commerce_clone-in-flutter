import 'package:e_commerce/place_order.dart';
import 'package:e_commerce/single_product_place.dart';
import 'package:flutter/material.dart';
class adrees extends StatefulWidget {
  final String imglink,title,price,cartcount,check;
  adrees(this.imglink,this.title,this.price,this.cartcount,this.check);

  @override
  _adreesState createState() => _adreesState(imglink,title,price,cartcount,check);
}

class _adreesState extends State<adrees> {
  final String imglink,title,price,cartcount,check;
  TextEditingController name=new TextEditingController();
  TextEditingController city=new TextEditingController();
  TextEditingController h_adrees=new TextEditingController();
  TextEditingController number=new TextEditingController();
  TextEditingController state=new TextEditingController();
  final _key=GlobalKey<FormState>();

  _adreesState(this.imglink,this.title,this.price,this.cartcount,this.check);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Adrees'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('ADD ADRESS',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                autocorrect: true,
            validator: (String value){
                if(value.isEmpty){
                  return 'Enter Name';
                }
                return null;
            },
            controller: name,
            decoration: InputDecoration(
                hintText: "Enter Name",
                border:InputBorder.none,
                ),
    ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  autocorrect: true,
                  validator: (String value){
                    if(value.isEmpty){
                      return 'Enter number';
                    }
                    return null;
                  },
                  controller:number,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Number",
                    border:InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  autocorrect: true,
                  validator: (String value){
                    if(value.isEmpty){
                      return 'Please Enter Home Adress';
                    }
                    return null;
                  },
                  controller:h_adrees,
                  decoration: InputDecoration(
                    hintText: "Home Adress",
                    border:InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  autocorrect: true,
                  validator: (String value){
                    if(value.isEmpty){
                      return 'please enter state';
                    }
                    return null;
                  },
                  controller: state,
                  decoration: InputDecoration(
                    hintText: "Street No",
                    border:InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  autocorrect: true,
                  validator: (String value){
                    if(value.isEmpty){
                      return 'please enter city name';
                    }
                    return null;
                  },
                  controller: city,
                  decoration: InputDecoration(
                    hintText: "City Name",
                    border:InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 70,
        child: FloatingActionButton(
          onPressed: (){
            if(_key.currentState.validate()){
              if(check=='cart') {
                String Name = name.text;
                String Number = number.text;
                String Street = state.text;
                String Adrees = h_adrees.text;
                String City = city.text;
                Route route = MaterialPageRoute(builder: (context) =>
                    place_order(Name, Number, Street, Adrees, City));
                Navigator.push(context, route);
              }
              else if(check=='show_product'){
                String Name = name.text;
                String Number = number.text;
                String Street = state.text;
                String Adrees = h_adrees.text;
                String City = city.text;
                Route route = MaterialPageRoute(builder: (context) =>
                    single_product_place(Name, Number, Street, Adrees, City,imglink,title,price,cartcount));
                Navigator.push(context, route);
              }
            }
          },
          backgroundColor: Colors.red,
          child: Center(child: Text('Done',style: TextStyle(fontSize: 18.0),)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
        ),
      ),
    );
  }
}
