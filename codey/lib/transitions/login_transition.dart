
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginTransition extends StatefulWidget {

  @override
  State<LoginTransition> createState() => _LoginTransition();

}

class _LoginTransition extends State<LoginTransition>{
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          child: Image.asset('image/splash.jpg'),
          onTap: () {
            
          },
          ),
          ),
    );

  }
}