import 'package:codey/models/fromDatabase.dart';
import 'package:flutter/material.dart';
import 'package:codey/main_pages/slider.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  final GlobalKey<ScaffoldState> _menuKey = new GlobalKey<ScaffoldState>();
  String brandName = ""; 
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
        padding: EdgeInsets.all(20),
        color: Colors.brown[200],
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
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

            

            const SizedBox(height: 8),
            //-----------------------------------------------------------------------
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.33,
                width: MediaQuery.of(context).size.width * 0.90,
                child: Image.asset('images/caraousel.png'),
              ),
            ),
            const SizedBox(height: 6),

            //-------------------------------------------------------------------------

             FromDatabase(brandName: ''),
          ]),
        ),
      ),
    );
  }
}
