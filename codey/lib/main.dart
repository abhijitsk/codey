import 'package:flutter/material.dart';
import 'package:codey/login/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:codey/login/loginroute.dart';
//import 'package:codey/login/home_page.dart';

void main() async {
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
      home: Loginroute(),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Hi'),
    );
  }
}

