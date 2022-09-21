import 'dart:ffi';

import 'package:codey/models/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FromDatabase extends StatefulWidget{
  FromDatabase({Key? key, required this.brandName}) : super(key: key);
  String brandName = "";
  
  @override
  

  _FromDatabaseState createState()=>_FromDatabaseState();
}

class _FromDatabaseState extends State<FromDatabase>{
  final user = FirebaseAuth.instance.currentUser;


  final Stream<QuerySnapshot>  database = FirebaseFirestore.instance.collection('Database').snapshots();
  
    
  
  
  
  @override

  addRemovefav(List id,bool isFav){

    if(isFav==false){
      try{
       FirebaseFirestore.instance.collection('EditProfile').doc(user?.email.toString()).update({'fav':FieldValue.arrayUnion(id)});
    }catch(e){

      print('error');

    }

    }else{
      try{
         FirebaseFirestore.instance.collection('EditProfile').doc(user?.email.toString()).update({'fav':FieldValue.arrayRemove(id)});

      }catch(e){

      }
    }

    


  }

  

  Widget build(BuildContext context){
    return FutureBuilder(
      future: FirestoreData().getData(),
      builder: (context,AsyncSnapshot userdata) {
       
          return Container(
          
          width: MediaQuery.of(context).size.width*1,
          color: Colors.brown[400],
          child: StreamBuilder<QuerySnapshot>(stream: database,builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
            if  (snapshot.hasError){
              return const Text('Something Went Wrong');
            }
            if (snapshot.connectionState==ConnectionState.waiting){
              return const Text('Connection issue');
            }
            final data = snapshot.requireData;
            
          
            
            return ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 700,),
                      child: ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index){
                  var search_data = snapshot.data!.docs[index].data()
                    as Map<String,dynamic>;
                  bool _islikebuttonClicked = false;
                  if(userdata.data['fav'].contains(data.docs[index].id)){
                    _islikebuttonClicked = true;

                  }

                  

                  if (search_data['Name'].toString().toLowerCase().startsWith(widget.brandName.toLowerCase())){
                   return Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.brown[300],
                          ),
                        child: Row(
                          children: [
                            const SizedBox(width:10),

                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(),
                              height: 90,
                              width: 80,
                              child: Image.asset(data.docs[index]['logo'],fit:BoxFit.fill),
                              ),

                            const SizedBox(width:5),

                            Container(
                              width: 150,
                              color: Colors.brown[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center, 
                                children: [
                                  Text(
                                    textAlign:TextAlign.center,
                                    data.docs[index]['Name'].toString(),
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown[600]),
                                  ),
                                  Text(
                                    textAlign:TextAlign.center,
                                  ''+data.docs[index]['offer']+ '% off'+' on selected merchandise'+'\n'+'Grab it before offer expires',
                                  style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.brown[600]),
                                  ),
                                  //Text(data.docs[index].id),
                                  //Text(userdata.data['fav'].runtimeType.toString()),
                                  //Text([data.docs[index].id.toString()].runtimeType.toString()),
                                  //Text((userdata.data['fav'].contains(data.docs[index].id).toString()).toString())
                                  
                              ],),
                            ),

                            const SizedBox(width:5),

                            

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              IconButton(
                                onPressed: (){
                                  
                                  addRemovefav([data.docs[index].id],_islikebuttonClicked);
                                  
                                  setState(() {

                                    
                                    _islikebuttonClicked = !_islikebuttonClicked;
                                  });
                                   },
                                icon:  Icon(Icons.favorite,
                                  color: _islikebuttonClicked? Colors.red:Colors.grey,)),

                              const SizedBox(height: 30,),

                              MaterialButton(
                                onPressed: (){
                                  var code = data.docs[index]['offerCode'];
                                  showModalBottomSheet(
                                    backgroundColor: Colors.brown[200],
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(top:Radius.circular(25))
                                    ), 
                                    builder: (BuildContext context){
                                    return Container(
                                      padding: const EdgeInsets.all(20),

                                      height: MediaQuery.of(context).size.height*0.7,
                                      child: Column(

                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              CircleAvatar(
                                                radius: 50,
                                                //child: Image.asset(data.docs[index]['logo']),
                                                foregroundImage: AssetImage(data.docs[index]['logo'],),
                                              ),

                                              Container(
                                                width: MediaQuery.of(context).size.width*0.5,
                                                child: Center(
                                                  child: Text(
                                                    textAlign:TextAlign.center,
                                                    data.docs[index]['Name'].toString(),
                                                    style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                                                    ),
                                                ),
                                              ),
                                              const InkWell(
                                                
                                                child: Icon(Icons.share),),
                                            ],
                                          ),
                                          const SizedBox(height:35),
                                          Text(
                                            textAlign:TextAlign.center,
                                            data.docs[index]['offer'].toString()+'% offer on selected items click below to get the offer'),
                                          
                                          const SizedBox(height:45),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                color: Colors.grey,
                                                height: MediaQuery.of(context).size.height*0.05,
                                                width: MediaQuery.of(context).size.width*0.60,
                                                child: Center(child: Text(data.docs[index]['offerCode'])),
                                              ),
                                              MaterialButton(
                                                color: Colors.grey,
                                                onPressed: (){},
                                                child: const Text('Copy Code'),)
                                            ],
                                          ),
                                          const SizedBox(height:35),

                                          const Center(child: Text(
                                            'Visit the store',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.underline),),),
                                          
                                        ],
                                      ),);

                                  });
                                },
                                color: Colors.blueGrey,
                                child: const Text('Get Code'),
                                ),
                            ],),

                            
                          ]),
                      ),
                    ),
                  
                  );
 
                  }
                  
                  return Container(
                    color: Colors.blue,
                  );          
                  }
                ),
            );

          },) ,);

        
        

        
      }
    );
  }

}

class _ShowCode extends StatelessWidget{
  const _ShowCode({Key? key, required this.getcode}) : super(key: key);
  final String getcode;
  
  
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.brown[200],
      elevation: 4,
      contentPadding: const EdgeInsets.all(25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: const Center(
        child: Text(
          'Get Code',
          style: TextStyle(color: Colors.brown),
          )),


      content: Container(
                
        height: MediaQuery.of(context).size.height*0.1,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height:10),
              Text(
                getcode,
                style: const TextStyle(color: Colors.deepOrange,fontSize: 30),
                ),
              
            ],
          )),
      ),



      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text('OK')),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text('Cancel')),
      ],
    );
  }
  
}