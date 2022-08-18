import 'package:flutter/material.dart';
import 'package:codey/main_pages/slider.dart';

import 'categories.dart';

class BodyPage extends StatefulWidget {
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  final GlobalKey<ScaffoldState> _menuKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _menuKey,
      appBar: AppBar(
        title: Text('Codey'),
      ),
      drawer: SliderPage(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: 20),

            //-------------------------------------------------------------------------
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Browse Offers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //------------------------------------------------------------------------
            SizedBox(height: 15),

            Container(

              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(width: 1.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: SafeArea(
                                              child: TextField(
                          style: TextStyle(decoration: TextDecoration.none),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.grey[700],
                            ),
                            hintText: 'Search.....',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Container(
                height: MediaQuery.of(context).size.height* 0.06,
                width: MediaQuery.of(context).size.width*0.16,
                child: IconButton(
                  onPressed: (){}, icon: Image.asset('images/filter.png')),)
              ]),
            ),
            //-----------------------------------------------------------------------
            Container(
              height: MediaQuery.of(context).size.height*0.33,
              width: MediaQuery.of(context).size.width*0.90,
              child: Image.asset('images/caraousel.png'),
            ),


            //-------------------------------------------------------------------------


            CategoriesHome(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
      ),
    );
  }
}
