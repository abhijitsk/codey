import 'package:flutter/material.dart';

class CategoriesHome extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left :8.0),
              child: Text(
                'Browse Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
                ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                'Sea All',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20)
                ),
              
              ),
          ],
        ),


        SingleChildScrollView(

          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children:[
                Container(
                  height: MediaQuery.of(context).size.height*0.14,
                  width: MediaQuery.of(context).size.width *0.34,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      InkWell(
                        child: Image.asset('images/food.png',
                          height: 80,
                          color: Colors.brown[800],
                          ),
                        ),
                      Text('Food'),
                      
                    ],
                  ),
                ),
                //---------------------------------------------------------------------------
                SizedBox(width:15),
                Container(
                  height: MediaQuery.of(context).size.height*0.14,
                  width: MediaQuery.of(context).size.width *0.34,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      InkWell(
                        child: Image.asset('images/fashion.png',
                          height: 80,
                          color: Colors.brown[800],
                          ),
                        ),
                      Text('Fashion'),
                      
                    ],
                  ),
                ),
                //---------------------------------------------
                SizedBox(width:15),

                Container(
                  height: MediaQuery.of(context).size.height*0.14,
                  width: MediaQuery.of(context).size.width *0.34,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      InkWell(
                        child: Image.asset('images/footwear.png',
                          height: 80,
                          color: Colors.brown[800],
                          ),
                        ),
                      Text('Footwear'),
                      
                    ],
                  ),
                ),
                //---------------------------------------------------------------------------
                SizedBox(width:15),

                Container(
                  height: MediaQuery.of(context).size.height*0.14,
                  width: MediaQuery.of(context).size.width *0.34,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      InkWell(
                        child: Image.asset('images/jewellry.png',
                          height: 80,
                          color: Colors.brown[800],
                          ),
                        ),
                      Text('Jewellery'),
                      
                    ],
                  ),
                ),
                //---------------------------------------------------------------------------
                

                
              ]
            ),
          ),
        ),
      ],
    );
  }
}