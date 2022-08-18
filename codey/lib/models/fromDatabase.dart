import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FromDatabase extends StatefulWidget{
  @override

  _FromDatabaseState createState()=>_FromDatabaseState();
}

class _FromDatabaseState extends State<FromDatabase>{

  List<String> docIds = [];
  final Stream<QuerySnapshot>  database = FirebaseFirestore.instance.collection('Database').snapshots();

  Future getName() async{
    await FirebaseFirestore.instance.collection('Database').get().then((snapshot) => snapshot.docs.forEach((element) { 
      print(element.reference);
      docIds.add(element.reference.id);
    }));
  }
  @override



  Widget build(BuildContext context){
    return Container(
      child: StreamBuilder<QuerySnapshot>(stream: database,builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
        if  (snapshot.hasError){
          return Text('Something Went Wrong');
        }
        if (snapshot.connectionState==ConnectionState.waiting){
          return Text('Connection issue');
        }
        final data = snapshot.requireData;
        
        return ListView.builder(
          itemCount: data.size,
          itemBuilder: (context, index){
            return Text(data.docs[index]['Name']);
          });

      },) ,);
  }

}