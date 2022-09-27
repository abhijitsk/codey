import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogOutPopUp extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser!;

  LogOutPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(left: 15,right: 15),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      backgroundColor: Colors.brown[300],
      elevation: 50,
      contentPadding: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5) ),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.power_settings_new_outlined,
          size: 40,
          color: Colors.brown,
          shadows: [
            Shadow(
              color: Colors.brown,
              blurRadius: 10,
              offset: Offset(2,4)
            )
          ]
          ,)

        ]),
      content: const Text('Continue to LogOut ?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
          FirebaseAuth.instance.signOut();
        },
        child: const Text('Yes',
        style: TextStyle(
          fontSize: 15,
          color: Colors.brown,
          fontWeight: FontWeight.bold),),),
        TextButton(onPressed: (){
          Navigator.pop(context);
        },
        child: const Text('No',
        style: TextStyle(
          fontSize: 15,
          color: Colors.brown,
          fontWeight: FontWeight.bold),),)
      ],
    );

  }
}