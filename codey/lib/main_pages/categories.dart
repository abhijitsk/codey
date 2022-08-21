import 'package:flutter/material.dart';
import 'package:codey/models/fromDatabase.dart';


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
              child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FromDatabase()));
                  },
                  child: Text(
                  'Sea All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20)
                  ),
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
                  padding: EdgeInsets.only(top:5),
                  height: MediaQuery.of(context).size.height*0.11,
                  width: MediaQuery.of(context).size.width *0.20,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      InkWell(
                        child: Image.asset('images/food.png',
                          height: 60,
                          color: Colors.white,
                          ),
                        ),
                      //SizedBox(height:5),
                      Text('Food'),
                      
                    ],
                  ),
                ),
                //---------------------------------------------------------------------------
                SizedBox(width:15),
                Container(
                  height: MediaQuery.of(context).size.height*0.11,
                  width: MediaQuery.of(context).size.width *0.20,
                  decoration: BoxDecoration(
                    border: Border.all(width: 5,color: Colors.brown.shade600),
                    color: Colors.brown[600],
                    borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      SizedBox(height: 3,),
                      InkWell(
                        child: Image.asset('images/fashion.png',
                          height: 60,
                          color: Colors.white,
                          ),
                        ),
                      
                      Text('Fashion'),
                      
                    ],
                  ),
                ),
                //---------------------------------------------
                SizedBox(width:15),

                Container(
                  height: MediaQuery.of(context).size.height*0.11,
                  width: MediaQuery.of(context).size.width *0.20,
                  decoration: BoxDecoration(
                    color: Colors.brown[600],
                    borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      InkWell(
                        child: Image.asset('images/footwear.png',
                          height: 60,
                          color: Colors.white,
                          ),
                        ),
                      Text('Footwear'),
                      
                    ],
                  ),
                ),
                //---------------------------------------------------------------------------
                SizedBox(width:15),

                Container(
                  height: MediaQuery.of(context).size.height*0.11,
                  width: MediaQuery.of(context).size.width *0.20,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      InkWell(
                        child: Image.asset('images/jewellry.png',
                          height: 60,
                          color: Colors.white,
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