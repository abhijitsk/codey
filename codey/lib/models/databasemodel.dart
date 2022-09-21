import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  late FirebaseFirestore firestore;
  initialiase(){
    firestore = FirebaseFirestore.instance;
  }

  Future<List> read()async{
    List docs = [];

    QuerySnapshot querySnapshot;

    try{
      querySnapshot = await firestore.collection('Database').get();
      if (querySnapshot.docs.isNotEmpty){
        for (var doc in  querySnapshot.docs.toList()){
          Map a ={'id':doc.id,'gender':doc['Gender'],'name':doc['Name'],'logo':doc['logo'],'offerCode':doc['offerCode']};
          docs.add(a);
        }
      }return docs;

    }catch(e){
      print(e);
    }


    return docs;
  }
  
  Future readFav()async{
    List Favs = [];
    QuerySnapshot querySnapshot;

    try{
      querySnapshot = await firestore.collection('EditProfile').get();
      if(querySnapshot.docs.isNotEmpty){

        for(var docs in querySnapshot.docs.toList()){
          Map a = {'check':docs['fav']};
          Favs.add(a);
        }
      }return Favs;

    }catch(e){

    }

    return ;
  }
}


