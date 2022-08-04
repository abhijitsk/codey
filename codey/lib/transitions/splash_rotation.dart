import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:codey/login/loginroute.dart';



class SplashTransition extends StatelessWidget{

  @override

  Widget build(BuildContext context){
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Image.asset('images/logo.png'),
      backgroundColor: Colors.brown,
      splashIconSize: 120,
      
      
      
      nextScreen: Loginroute() ,
    );
  }

  
}
