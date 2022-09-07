import 'package:flutter/material.dart';
//import 'package:codey/models/fromDatabase.dart';


class CategoriesHome extends StatelessWidget{
  const CategoriesHome({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context){
    return SafeArea(
          child: Container(
        padding: EdgeInsets.all(15.0),
        color: Colors.brown[200],
        child: Column(children: [
          SizedBox(height:25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Card(
              elevation: 10,
              child: Container(
                color: Colors.brown[200],
                height: MediaQuery.of(context).size.height*0.35,
                width: MediaQuery.of(context).size.width*0.42,
                child:InkWell(
                  child: Image.asset('images/fashion.jpg'),)
              ), ),
            Card(
              elevation: 10,
              child: Container(
                color: Colors.brown[200],
                height: MediaQuery.of(context).size.height*0.35,
                width: MediaQuery.of(context).size.width*0.42,
                child:InkWell(
                  child: Image.asset(
                    'images/footwear.jpg',
                    height: MediaQuery.of(context).size.height*0.001,),)
              ), ),
          ],),
          //------------------------------------------------------------------------------------------->
          SizedBox(height:15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Card(
              elevation: 10,
              child: Container(
                color: Colors.brown[200],
                height: MediaQuery.of(context).size.height*0.35,
                width: MediaQuery.of(context).size.width*0.42,
                child:InkWell(
                  child: Image.asset('images/jewellery.jpg'),)
              ), ),
            Card(
              elevation: 10,
              child: Container(
                color: Colors.brown[200],
                height: MediaQuery.of(context).size.height*0.35,
                width: MediaQuery.of(context).size.width*0.42,
                child: InkWell(
                  child: Image.asset('images/food.jpg'),)
              ), ),
          ],),
          
        ]),
      ),
    );
  }
}