import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codey/models/profileinfo.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 50),

              //--------------------------------------------------------------->
              Profileinfo(),
              //--------------------------------------------------------------->
              const SizedBox(height:80),
              Container(
                //color: Colors.black,
                height: MediaQuery.of(context).size.height*0.1,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft:Radius.circular(35),
                    bottomRight: Radius.circular(35), )),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '125',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                            ),),
                        const Text(
                          'Shops',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                            ),),
                      ],),
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '05',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                            ),),
                        const Text(
                          'Caategories',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                            ),),
                      ],),
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '1205',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                            ),),
                        const Text(
                          'Codes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                            ),),
                        
                      
                      ],),

                  ]),),
                //----------------------------------------------------------------->
                SizedBox(height:15),
              
            ],
          )),
    ));
  }
}
