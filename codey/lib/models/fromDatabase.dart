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
      color: Colors.white,
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
            return Container(
              padding: EdgeInsets.all(15),
              height: 110,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              
              child: Row(
                children: [
                  Image.asset(data.docs[index]['logo'],height: 50,),
                  SizedBox(width:35),
                  Column(children: [
                    SizedBox(height:20),
                    Text(data.docs[index]['Name'],style: TextStyle(fontSize: 20,color: Colors.blueGrey),),
                    Text(data.docs[index]['category'],style: TextStyle(fontSize: 20,color: Colors.blueGrey),),
                  ],),
                  SizedBox(width:20),
                  Container(
                  color: Colors.yellow,
                  child: MaterialButton(
                  onPressed: (){},
                  child: Text('Get Code'),
                  ),
                  
                  )
                ],
              ));
          });

      },) ,);
  }

}