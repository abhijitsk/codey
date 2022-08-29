import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

late final DocumentSnapshot snapshot;

class Profileinfo extends StatelessWidget {
  const Profileinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<DocumentSnapshot> data2() async {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('EditProfile')
          .doc('sample@mail.com')
          .get();

      return (snapshot);
    }

    return Container(
      height: 270,
      
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          title: FutureBuilder(
        future: data2(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
        },
      )),
    );
  }
}