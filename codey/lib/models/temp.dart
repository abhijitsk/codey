import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codey/models/database.dart';

class Temp extends StatelessWidget{
  List dataList = [];
  @override

  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: FirestoreData1().getData(),
        builder: (context,snapshot){
          return Text((snapshot.data).toString());
        }
        )
      );
    }
  
}