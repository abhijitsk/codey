import 'package:codey/models/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Temp extends StatelessWidget{
  Temp({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  final List <Map<String,dynamic>> dataList = [
    {
      'Gender':'Unisex',
      'Name': 'Starbucks',
      'category': 'Food',
      'countries':'ALL',
      'logo':'images/starbucks.jpg.jpg',
      'offer':'20',
      'offerCode':'STARBUCKSSTAR020'

    },
    {
      'Gender':'Unisex',
      'Name': 'Mc Donalds',
      'category': 'Food',
      'countries':'ALL',
      'logo':'images/mcdonalds.jpg',
      'offer':'28',
      'offerCode':'MCDONALDSMCDONA28'

    },
    {
      'Gender':'Unisex',
      'Name': 'Subway',
      'category': 'Food',
      'countries':'ALL',
      'logo':'images/subway.jpg',
      'offer':'25',
      'offerCode':'CHANELCHANELCHANEL625'

    },
    {
      'Gender':'Unisex',
      'Name': 'Yum',
      'category': 'Food',
      'countries':'ALL',
      'logo':'images/yum.jpg',
      'offer':'5',
      'offerCode':'YUMYUMYUMYUMY05'

    },
    {
      'Gender':'Unisex',
      'Name': 'KFC',
      'category': 'Food',
      'countries':'ALL',
      'logo':'images/kfc.jpg',
      'offer':'16',
      'offerCode':'KFCKFCKFCKFCE16'

    },
    {
      'Gender':'Unisex',
      'Name': 'Domino\'s',
      'category': 'Food',
      'countries':'ALL',
      'logo':'images/dominos.jpg',
      'offer':'30',
      'offerCode':'00SDOMINOSDOLERS30'

    },
    {
      'Gender':'Unisex',
      'Name': 'Wendy\'s',
      'category': 'Food',
      'countries':'ALL',
      'logo':'images/wendys.jpg',
      'offer':'6',
      'offerCode':'WENDYSWENDYSWERN06'

    },
    {
      'Gender':'Unisex',
      'Name': 'Smoking Joe\'s',
      'category': 'Food',
      'countries':'ALL',
      'logo':'images/smokingjoeslogo.jpg',
      'offer':'8',
      'offerCode':'PANDORAPANDORA0808'

    },
    {
      'Gender':'Unisex',
      'Name': 'PIZZA HUT ',
      'category': 'Food',
      'countries':'ALL',
      'logo':'images/pizzahut.jpg',
      'offer':'25',
      'offerCode':'HAARY09WINSTON&M25'

    },
    {
      'Gender':'Unisex',
      'Name': 'Dunkin\' Donuts',
      'category': 'Food',
      'countries':'ALL',
      'logo':'images/dunkin.jpg',
      'offer':'45',
      'offerCode':'DUNKINSDONUTSKLO045'

    },
  ];

  

  
  adddata()async{
    for (var element in dataList){
      FirebaseFirestore.instance.collection('Database').add(element);
    }

  }

  addarray()async{
    var list = ['123456789'];
    var data  = FirestoreData().getData();
    try{
      
     FirebaseFirestore.instance.collection('EditProfile').doc(user.email.toString()).update({'fav':FieldValue.arrayUnion(list)});

    }catch(e){
     print('error');
    }
    
    
  }
  @override

  Widget build(BuildContext context){
    return FutureBuilder(
      future: FirestoreData().getData(),
      builder: (context,AsyncSnapshot data) {
        
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              MaterialButton(
                color: Colors.brown,
                
                child: Text('Add data'),
                onPressed: (){
                  adddata();
                },
              ),
               //Text(data.data.data()['fav'].toString()),
              //Text(check.toString())
            ],
          ),
          );
      }
    );
    }
  
}