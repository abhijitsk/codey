import 'package:flutter/material.dart';
import 'package:codey/main_pages/slider.dart';

class BodyPage extends StatelessWidget {
  @override

  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(title: Text('Codey')),
      body: Center(
        child: Text('HOMEPAGE'),
         ),
      drawer: SliderPage(),

    );
  }
}