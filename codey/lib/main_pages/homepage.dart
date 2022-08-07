import 'package:flutter/material.dart';
import 'package:codey/main_pages/slider.dart';

class BodyPage extends StatefulWidget{
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  final GlobalKey<ScaffoldState> _menuKey = new GlobalKey<ScaffoldState>();
  @override

  Widget build(BuildContext context){
    return  Scaffold(
      key: _menuKey,
      
      appBar: AppBar(
        title: Text('Codey'),
        ),


      drawer: SliderPage(),


      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal:10),
        child: Column(
          children: <Widget>[
            SizedBox(height:20),

            //-------------------------------------------------------------------------
            Align(
              
              alignment: Alignment.centerLeft,
              child:Text(
                
                'Browse Offers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  
                  ),
                ),),
            //------------------------------------------------------------------------
            SizedBox(height:15),
            Container(
              height: 200 ,
              width: double.infinity,
              color: Colors.indigoAccent,
              ),
            
            //-------------------------------------------------------------------------
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
                Card(
                  child: Container(
                    height: 200,
                    width: 150,
                    color: Colors.amber,
                    ),
                ),
              ],
            ),

          ]),
      ),
      

    );
  }
}