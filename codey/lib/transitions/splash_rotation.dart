import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:codey/login/loginroute.dart';



class SplashTransition extends StatelessWidget{
  const SplashTransition({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context){
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Image.asset('images/logo.png'),
      backgroundColor: Colors.brown,
      splashIconSize: 120,
      
      
      
      
      nextScreen: const Loginroute() ,
    );
  }

  
}
