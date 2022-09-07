import 'package:flutter/material.dart';
import 'package:codey/login/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:codey/main_pages/bottomNav.dart';



class Loginroute extends StatelessWidget{
  const Loginroute({Key? key}) : super(key: key);


  
  @override

  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            return  BottomNav();
          }else{
            return const Loginpage();
          }
        } ),
    );

  }
}