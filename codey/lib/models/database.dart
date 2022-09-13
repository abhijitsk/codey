import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirestoreData{

  List data = [];

  final CollectionReference collectionRef = FirebaseFirestore.instance.collection('EditProfile');

  Future getData() async{
    try{
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs){
          data.add(result.data());
        }
      });
 
      return data;

    }catch(e){
      return null;
    }
  }
}

class FirestoreData1{
  String poda = 'empty';
  late final user = FirebaseAuth.instance.currentUser!;

  List data = [];
  var data1;

  final CollectionReference collectionRef = FirebaseFirestore.instance.collection('EditProfile');

  Future getData() async{
    data1 = await collectionRef.doc(user.email!).get() ;
    if(data1.exists){
      Map<String,dynamic> data2 = data1.data();
      return data1;
    }else{
      return poda;
    }
    
    

  }
}