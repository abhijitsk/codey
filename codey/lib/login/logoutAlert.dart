import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogOutPopUp extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser!;

  LogOutPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      elevation: 4,
      contentPadding: const EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5) ),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.power_settings_new_outlined,
          color: Colors.brown,)

        ]),
      content: const Text('Do you want to LogOut ?',
          textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
          FirebaseAuth.instance.signOut();
        },
        child: const Text('Yes'),),
        TextButton(onPressed: (){
          Navigator.pop(context);
        },
        child: const Text('No'),)
      ],
    );

  }
}