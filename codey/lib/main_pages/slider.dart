import 'package:flutter/material.dart';
import 'package:codey/login/logoutAlert.dart';

class SliderPage extends StatefulWidget{

  @override

  State<SliderPage> createState() => _SliderPage();
}

class _SliderPage extends State<SliderPage>{
  @override

  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: GestureDetector(
              onTap:(){
                Navigator.pop(context);
              }, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset('images/profile.png',
                    height: 60,
                    ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center ,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Customer Name',
                            style: TextStyle(fontSize: 16,
                            color: Colors.red),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Location',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),),

                        ),
                        
                        ],
                      ),
                    
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.arrow_forward_ios),
                    padding: EdgeInsets.all(0),
                    alignment: Alignment.centerRight,
                    )
                ]
                ),
                ),
                decoration: BoxDecoration(color: Colors.brown),
              ),
              // --------------------------------------------------------------
              //
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: ListTile(
                  title: Text('Profile',
                  style:TextStyle(
                    color: Colors.brown[600],
                    fontWeight: FontWeight.bold)
                    ),
                  leading: Icon(Icons.person_outline,size: 30,),
                ),
                
              
              ),
              //-----------------------------------------------------------------
              Padding(padding: const EdgeInsets.all(0.0),
              child: ListTile(
                title :Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
                    ),
                  leading: Icon(Icons.category_outlined,size: 30,),
                  ),
                ),
              //-----------------------------------------------------------------
              Padding(padding: const EdgeInsets.all(0.0),
              child: ListTile(
                title :Text(
                  'My Favourites',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
                    ),
                  leading: Icon(Icons.stars_outlined,size: 30,),
                  ),
                ),
              //-----------------------------------------------------------------
              Padding(padding: const EdgeInsets.all(0.0),
              child: ListTile(
                title :Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
                    ),
                  leading: Icon(Icons.settings_outlined,size: 30,),
                  ),
                ),
              //-----------------------------------------------------------------
              Padding(padding: const EdgeInsets.all(0.0),
              child: ListTile(
                title :Text(
                  'Customer Service',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
                    ),
                  leading: Icon(Icons.headset_mic_outlined,size: 30,),
                  ),
                ),
              //-----------------------------------------------------------------
              Padding(padding: const EdgeInsets.all(0.0),
              child: ListTile(
                title :Text(
                  'Country',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
                    ),
                  leading: Icon(Icons.flag_outlined),
                  ),
                ),
              //-----------------------------------------------------------------
              Padding(padding: const EdgeInsets.all(0.0),
              child: ListTile(
                title :Text(
                  'LogOut',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
                    ),
                  leading: Icon(Icons.power_settings_new),
                  onTap: (){
                    Navigator.pop(context);
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return LogOutPopUp();
                      });
                    
                  },
                  ),
                )
        ]
        
        ),

    );
  }
  
}

