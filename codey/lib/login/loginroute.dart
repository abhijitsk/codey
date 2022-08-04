import 'package:flutter/material.dart';
import 'package:codey/login/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:codey/login/home_page.dart';



class Loginroute extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            return Homepage();
          }else{
            return Loginpage();
          }
        } ),
    );

  }
}