import 'package:codey/models/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Temp extends StatelessWidget{
  Temp({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  List <Map<String,dynamic>> dataList = [
    {
      'Gender':'Unisex',
      'Name': 'Louis Vuitton',
      'category': 'Fashion',
      'countries':'ALL',
      'logo':'images/louisvuitton.jpg',
      'offer':'25',
      'offerCode':'LOUISVUITTON25'

    },
    {
      'Gender':'Unisex',
      'Name': 'Gucci',
      'category': 'Fashion',
      'countries':'ALL',
      'logo':'images/gucci.jpg',
      'offer':'25',
      'offerCode':'GUCCI25'

    },
    {
      'Gender':'Unisex',
      'Name': 'Versace',
      'category': 'Fashion',
      'countries':'ALL',
      'logo':'images/versace.jpg',
      'offer':'25',
      'offerCode':'VERSACE25'

    },
    {
      'Gender':'Unisex',
      'Name': 'Givenchy',
      'category': 'Fashion',
      'countries':'ALL',
      'logo':'images/givenchy.jpg',
      'offer':'25',
      'offerCode':'GIVENCHY25'

    },
    {
      'Gender':'Unisex',
      'Name': 'Zara',
      'category': 'Fashion',
      'countries':'ALL',
      'logo':'images/zara.jpg',
      'offer':'70',
      'offerCode':'ZARA70'

    },
    {
      'Gender':'Unisex',
      'Name': 'Balenciaga',
      'category': 'Fashion',
      'countries':'ALL',
      'logo':'images/balenciaga.jpg',
      'offer':'30',
      'offerCode':'BALENCIAGA30'

    },
    {
      'Gender':'Unisex',
      'Name': 'Dolce & Gabbana',
      'category': 'Fashion',
      'countries':'ALL',
      'logo':'images/dolcegabbana.jpg',
      'offer':'30',
      'offerCode':'DOLCE&GABBANA30'

    },
    {
      'Gender':'Unisex',
      'Name': 'Prada',
      'category': 'Fashion',
      'countries':'ALL',
      'logo':'images/prada.jpg',
      'offer':'45',
      'offerCode':'PRADA45'

    },
    {
      'Gender':'Unisex',
      'Name': 'H&M',
      'category': 'Fashion',
      'countries':'ALL',
      'logo':'images/h&m.jpg',
      'offer':'45',
      'offerCode':'CODEH&M45'

    },
    {
      'Gender':'Unisex',
      'Name': 'Levi\'s',
      'category': 'Fashion',
      'countries':'ALL',
      'logo':'images/levis.jpg',
      'offer':'45',
      'offerCode':'LEVIS45'

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
                  addarray();
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