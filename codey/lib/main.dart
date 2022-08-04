import 'package:codey/login/home_page.dart';
import 'package:codey/transitions/login_transition.dart';
import 'package:flutter/material.dart';
//import 'package:codey/login/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:codey/login/loginroute.dart';
import 'package:codey/transitions/splash_rotation.dart';
import 'package:codey/main_pages/homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      title: "Codey",
      //home: SplashTransition(),
      home: BodyPage(),
    );
  }
}
