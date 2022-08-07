import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogOutPopUp extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      elevation: 4,
      contentPadding: EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5) ),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.power_settings_new_outlined,
          color: Colors.brown,)

        ]),
      content: Text('Do you want to LogOut ?',
          textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
          FirebaseAuth.instance.signOut();
        },
        child: Text('Yes'),),
        TextButton(onPressed: (){
          Navigator.pop(context);
        },
        child: Text('No'),)
      ],
    );

  }
}