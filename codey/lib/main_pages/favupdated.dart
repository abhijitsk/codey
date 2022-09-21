import 'package:codey/models/database.dart';
import 'package:codey/models/databasemodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/databasemodel.dart';

class FavUpdated extends StatefulWidget{

  FavUpdatedState createState()=> FavUpdatedState();
}

class FavUpdatedState extends State<FavUpdated>{


  

  final Stream<QuerySnapshot>  database = FirebaseFirestore.instance.collection('Database').snapshots();

  Future<DocumentSnapshot> getData()async{ 
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection('EditProfile').doc(FirebaseAuth.instance.currentUser!.email.toString()).get();

    return docSnapshot;

  }
  @override

  Widget build(BuildContext context){
    return FutureBuilder(
      future: getData(),
      builder: (context, AsyncSnapshot data){
        

        if (data.connectionState==ConnectionState.done){


          if(data.data.data()['fav'].isEmpty){
            return Container(
              color: Colors.brown[200],
              child: Center(child: Text('No Fav added')),
            );

          }

          var favourites = data.data.data()['fav'];
          List a = [];

          return Container(
              padding: EdgeInsets.all(25),
              color: Colors.brown[200],
              child: ListView.builder(
                itemCount: favourites.length,
                itemBuilder: (context,index){
                  return SingleChildScrollView(
                                      child: Container(
                      
                      color: Colors.brown[200],
                      child: StreamBuilder(
          stream: database,
          builder:(BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot) {
            if(snapshot.hasError){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.connectionState==ConnectionState.active){
              

             for( var streamData in snapshot.data!.docs){
               
               if(favourites[index].toString()==streamData.id.toString()){
                 if(streamData.exists){
                     
                     a.add(streamData.data());

                     

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
                              //Text('This is where card needs to be places'),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(),
                                height: 90,
                                width: 80,
                                //child: Text(a[0]['offer'].toString()),
                                child: Image.asset(a[index]['logo'],fit:BoxFit.fill),
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
                        a[index]['Name'].toString(),
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown[600]),
                      ),
                      Text(
                        textAlign:TextAlign.center,
                      ''+a[index]['offer']+ '% off'+' on selected merchandise'+'\n'+'Grab it before offer expires',
                      style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.brown[600]),
                      ),
                      
                      
                      //Text((snapshot.data?.docs[index]['']).toString())
                      
                ],),
              ),

              const SizedBox(width:5),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.favorite,color: Colors.red,),
                    ),
                const SizedBox(height: 30,),

                MaterialButton(
                    onPressed: (){
                      var code = a[index]['offerCode'];
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
                                    foregroundImage: AssetImage(a[index]['logo'],),
                                  ),

                                  Container(
                                    width: MediaQuery.of(context).size.width*0.5,
                                    child: Center(
                                      child: Text(
                                        textAlign:TextAlign.center,
                                        a[index]['Name'].toString(),
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
                               a[index]['offer'].toString()+'% offer on selected items click below to get the offer'),
                              
                              const SizedBox(height:45),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: Colors.grey,
                                    height: MediaQuery.of(context).size.height*0.05,
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Center(child: Text(a[index]['offerCode'])),
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

                            ],
                          )
                          )
                        ),
                 );

                 }
                 

               }

             }
              
              

              return SingleChildScrollView(
                                          child: Column(
                    children: [
                      Text(snapshot.data!.docs.runtimeType.toString()),
                      Text(snapshot.data!.docs.length.toString()),
                      Text(snapshot.data!.docs[1].id.toString()),
                      Text(favourites[index].toString())
                    ],
                ),
              );
            }
            return Container();
          })
          ),
                  );
                    
                }),
            );

          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Text(data.data.exists.toString()),
                Text(data.hasData.toString()),
                Text((data.data.data()['fav']).runtimeType.toString()),
                Text(data.data.data()['fav'].length.toString()),
                Text(favourites.toString())
              ],
            ),
          );


        }

        return Center(
            child: CircularProgressIndicator());

      }
    );
      
    
  }
}