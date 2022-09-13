import 'package:flutter/material.dart';
//import 'package:codey/models/fromDatabase.dart';


class CategoriesHome extends StatelessWidget{
  const CategoriesHome({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context){
    return SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15.0),
        color: Colors.brown[400],
        child: Column(children: [
          const SizedBox(height:25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Card(
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    color: Colors.brown[200],
                    height: MediaQuery.of(context).size.height*0.35,
                    width: MediaQuery.of(context).size.width*0.42,
                    child:InkWell(
                      child: Image.asset('images/fashion.jpg',
                      fit:BoxFit.fill
                      ),)
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.04,
                    width: MediaQuery.of(context).size.width*0.42,
                    color: Colors.brown[300],
                    child: const Center(
                      child: Text(
                        'Fashion',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                    ),
                  ),
                ],
              ), ),
            Card(
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    color: Colors.brown[200],
                    height: MediaQuery.of(context).size.height*0.35,
                    width: MediaQuery.of(context).size.width*0.42,
                    child:InkWell(
                      child: Image.asset(
                        'images/footwear.jpg',
                        fit:BoxFit.fill,
                        ),)
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.04,
                    width: MediaQuery.of(context).size.width*0.42,
                    color: Colors.brown[300],
                    child: const Center(
                      child: Text(
                        'Footwear',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                    ),
                  ),
                ],
              ), ),
          ],),
          //------------------------------------------------------------------------------------------->
          const SizedBox(height:40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Card(
              
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    
                    color: Colors.brown[200],
                    height: MediaQuery.of(context).size.height*0.35,
                    width: MediaQuery.of(context).size.width*0.42,
                    child:InkWell(
                      child: Image.asset('images/jewellery.jpg',
                        fit:BoxFit.fill
                      ),)
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.04,
                    width: MediaQuery.of(context).size.width*0.42,
                    color: Colors.brown[300],
                    child: const Center(
                      child: Text(
                        'Jewellery',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                    ),
                  ),
                ],
              ), ),
            Card(
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    color: Colors.brown[200],
                    height: MediaQuery.of(context).size.height*0.35,
                    width: MediaQuery.of(context).size.width*0.42,
                    child: InkWell(
                      child: Image.asset('images/food.jpg',
                      fit:BoxFit.fill
                      ),)
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.04,
                    width: MediaQuery.of(context).size.width*0.42,
                    color: Colors.brown[300],
                    child: const Center(
                      child: Text(
                        'Food',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                    ),
                  ),
                ],
              ), ),
          ],),
          
        ]),
      ),
    );
  }
}