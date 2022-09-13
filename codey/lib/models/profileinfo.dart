import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Profileinfo extends StatelessWidget {
   Profileinfo({Key? key}) : super(key: key);
  late final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    Future<DocumentSnapshot> data2() async {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('EditProfile')
          .doc(user.email)
          .get();
      return snapshot;
      
    }

    return Container(
      height: 300,
      color: Colors.brown[400],
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          title: FutureBuilder(
        future: data2(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState==ConnectionState.done){
          if (!snapshot.data.exists){
            return Container(
              alignment: Alignment.center,
              height: 50,
              
              child: 
                Text('Please enter the details'),
                
              
            );
          
          }
            return Center(
            child: Column(
              children: [
                Container(
                
                  child: Image.asset(
                    'images/profile.png',
                    height: 150,
                    //fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data['first name'],
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    const SizedBox(width: 10),
                    Text(
                      snapshot.data['last name'],
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  snapshot.data['vlogger Id'],
                  style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  snapshot.data['DOB'].toString(),
                  style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),  
              ],
            ),
          );
          }else{
            return SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      )),
    );
  }
}
