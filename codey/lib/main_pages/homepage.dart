import 'package:codey/models/fromDatabase.dart';
import 'package:flutter/material.dart';
import 'package:codey/main_pages/slider.dart';
import 'categories.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

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
        title: const Text('Codey'),
        backgroundColor: Colors.brown,
      ),
      drawer: const SliderPage(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            const SizedBox(height: 20),

            //-------------------------------------------------------------------------
            const Align(
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
            const SizedBox(height: 15),

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
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(width: 1.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SafeArea(
                                              child: TextField(
                          style: const TextStyle(decoration: TextDecoration.none),
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

            const SizedBox(height:8),
            //-----------------------------------------------------------------------
            Container(
              height: MediaQuery.of(context).size.height*0.33,
              width: MediaQuery.of(context).size.width*0.90,
              child: Image.asset('images/caraousel.png'),
            ),
            const SizedBox(height:6),

            //-------------------------------------------------------------------------

 
            const FromDatabase(),
            
          ]),
        ),
      ),
    );
  }
}
