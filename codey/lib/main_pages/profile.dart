import 'package:flutter/material.dart';
import 'package:codey/models/profileinfo.dart';
import 'package:codey/models/userdetails.dart';

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
          color: Colors.brown[200],
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              //--------------------------------------------------------------->
              Profileinfo(),
              //--------------------------------------------------------------->
              const SizedBox(height:10),
              Card(
                elevation: 10,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)
                )),
                child: Container(
                  //color: Colors.black,
                  height: MediaQuery.of(context).size.height*0.1,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(35),
                      bottomRight: Radius.circular(35), )
                      ),
                  
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
              ),
                //----------------------------------------------------------------->
                SizedBox(height:70),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Card(
                        color: Colors.brown[300],
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, 
                              MaterialPageRoute(builder: (BuildContext context)=> const UserDetails()));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.14,
                            width: MediaQuery.of(context).size.width*0.4,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Icon(Icons.person_outline),
                              Text('Edit Profile'),
                            ],)
                          ),
                        ),
                        ),
                      Card(
                        color: Colors.brown[300],
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.14,
                            width: MediaQuery.of(context).size.width*0.4,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Icon(Icons.shopping_cart_outlined),
                              Text('List of Shops'),
                            ],)
                          ),
                        ),
                        ),
                    ],),
                    SizedBox(height: 18,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Card(
                        color: Colors.brown[300],
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.14,
                            width: MediaQuery.of(context).size.width*0.4,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Icon(Icons.settings_outlined),
                              Text('Settings'),
                            ],)
                          ),
                        ),
                        ),
                      Card(
                        color: Colors.brown[300],
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.14,
                            width: MediaQuery.of(context).size.width*0.4,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Icon(Icons.confirmation_num_outlined),
                              Text('Coupon Code'),
                            ],)
                          ),
                        ),
                        ),
                    ],)
                  ],)
              
            ],
          )),
    ));
  }
}
