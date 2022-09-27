import 'package:codey/main_pages/categories.dart';
import 'package:flutter/material.dart';
import 'package:codey/login/logoutAlert.dart';
import 'package:codey/main_pages/bottomNav.dart';
import 'package:codey/models/temp.dart';
import 'favupdated.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SliderPage extends StatefulWidget{
  SliderPage({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;
  String firstName = '';
  String lastName = '';

  readdata()async{
    var check = FirebaseFirestore.instance.collection('EditProfile').doc(user?.email).get();
    return check;
  }

 

  @override

  State<SliderPage> createState() => _SliderPage();
}

class _SliderPage extends State<SliderPage>{

  bool homeColor = true;
  bool catColor = true;
  bool favourite = true;
  bool carColor = true; 
  bool settingColor = true;
  bool custColor = true;
  bool countryColor =true;

  String dropdownvalue = 'DUBAI';
  var countrylist =[
    'DUBAI',
    'ABU DHABI',
    'SHARJAH',
    'AJMAN'
  ];
  @override

  Widget build(BuildContext context){

    return FutureBuilder(
      future: widget.readdata(),
      builder: (context,AsyncSnapshot asd) {
        if(asd.connectionState==ConnectionState.done){
          widget.firstName = asd.data['first name'];
          widget.lastName = asd.data['last name'];
        }
        return Drawer(
          backgroundColor: Colors.brown[200],
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
                        padding: const EdgeInsets.all(0.0),
                        child: Image.asset('images/profile.png',
                        height: 60,
                        ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center ,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    widget.firstName.toString(),
                                    style:  TextStyle(fontSize: 16,
                                    color: Colors.red,
                                    shadows: [
                                      Shadow(
                                        color: Colors.brown.shade800,
                                        offset: Offset(2,4),
                                        blurRadius: 8 ),
                                    ]),
                                  ),
                                  const SizedBox(width:5),
                                  Text(
                                    widget.lastName.toString(),
                                    style:  TextStyle(fontSize: 16,
                                    color: Colors.red,
                                    shadows: [
                                      Shadow(
                                        color: Colors.brown.shade800,
                                        offset: Offset(2,4),
                                        blurRadius: 8 ),
                                    ]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height:5),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                dropdownvalue,
                                style:  TextStyle(
                                  color: Colors.red,
                                  fontSize: 10,
                                  shadows: [
                                      Shadow(
                                        color: Colors.brown.shade800,
                                        offset: Offset(2,4),
                                        blurRadius: 8 ),
                                    ]
                                ),),

                            ),
                            
                            ],
                          ),
                        
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon:  Icon(Icons.arrow_forward_ios,
                        ),
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.centerRight,
                        )
                    ]
                    ),
                    ),
                    decoration: const BoxDecoration(color: Colors.brown),
                  ),
                  // --------------------------------------------------------------
                  //
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ListTile(
                      selected: homeColor,
                      onTap: (){
                        setState(() {
                          catColor = false;
                          favourite = false;
                          carColor = false; 
                          settingColor = false;
                          custColor = false;
                          countryColor =false;
                        
                        }
                        
                        );
                        Navigator.pop(context);
                        Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=> BottomNav(index: 3,)));
                      },
                      title: Text('Profile',
                      style:TextStyle(
                        color: Colors.brown[600],
                        fontWeight: FontWeight.bold,
                        shadows: [
                                      Shadow(
                                        color: Colors.brown.shade400,
                                        offset: const Offset(2,4),
                                        blurRadius: 8 ),
                                    ]
                        )
                        ),
                      leading:  Icon(Icons.person_outline,size: 30,
                      color: Colors.brown,
                      shadows: [
                          Shadow(
                            color:Colors.brown.shade300,
                            blurRadius: 8,
                            offset: Offset(1,3)
                          )
                        ],
                      ),
                    ),
                    
                  
                  ),
                  //-----------------------------------------------------------------
                  Padding(padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    selected: catColor,
                    onTap: (){
                      setState(() {
                        homeColor = false;
                        favourite = false;
                        settingColor = false;
                        custColor = false;
                        countryColor =false;
                      });
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav(index: 1,)));
                    },
                    title : Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        shadows: [
                                      Shadow(
                                        color: Colors.brown.shade400,
                                        offset: Offset(2,4),
                                        blurRadius: 8 ),
                                    ]
                        ),
                        ),
                      leading:  Icon(Icons.category_outlined,size: 30,
                      color: Colors.brown,
                      shadows: [
                          Shadow(
                            color:Colors.brown.shade300,
                            blurRadius: 8,
                            offset: Offset(1,3)
                          )
                        ],),
                      ),
                    ),
                  //-----------------------------------------------------------------
                  Padding(padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    selected: favourite,
                    onTap: (){
                      setState(() {
                        homeColor = false;
                        catColor = false; 
                        settingColor = false;
                        custColor = false;
                        countryColor =false;
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FavUpdated()));
                      });
                    },
                    title : Text(
                      'My Favourites',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        shadows: [
                                      Shadow(
                                        color: Colors.brown.shade400,
                                        offset: Offset(2,4),
                                        blurRadius: 8 ),
                                    ]
                        ),
                        ),
                      leading:  Icon(Icons.stars_outlined,size: 30,
                      color:Colors.brown,
                      shadows: [
                          Shadow(
                            color:Colors.brown.shade300,
                            blurRadius: 8,
                            offset: Offset(1,3)
                          )
                        ],),
                      ),
                    ),
                  //-----------------------------------------------------------------
                  Padding(padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    selected: settingColor,
                    onTap: (){
                      setState(() {
                        homeColor = false;
                        favourite = false;
                        catColor = false; 
                        custColor = false;
                        countryColor =false;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Temp()));
                    },
                    title : Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        shadows: [
                                      Shadow(
                                        color: Colors.brown.shade400,
                                        offset: Offset(2,4),
                                        blurRadius: 8 ),
                                    ]),
                        ),
                      leading:  Icon(Icons.settings_outlined,size: 30,
                      color:Colors.brown,
                      shadows: [
                          Shadow(
                            color:Colors.brown.shade300,
                            blurRadius: 8,
                            offset: Offset(1,3)
                          )
                        ],),
                      ),
                    ),
                  //-----------------------------------------------------------------
                  Padding(padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    selected: custColor,
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesSub(category: 'Fashion',)));
                    },
                    title : Text(
                      'Customer Service',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        shadows: [
                                      Shadow(
                                        color: Colors.brown.shade400,
                                        offset: Offset(2,4),
                                        blurRadius: 8 ),
                                    ]),
                        ),
                      leading:  Icon(Icons.headset_mic_outlined,size: 30,
                      color:Colors.brown,
                      shadows: [
                          Shadow(
                            color:Colors.brown.shade300,
                            blurRadius: 8,
                            offset: Offset(1,3)
                          )
                        ],
                      ),
                      ),
                    ),
                  //-----------------------------------------------------------------
                  Padding(padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    selected: countryColor,
                    onTap: (){

                      setState(() {
                        homeColor = false;
                        favourite = false;
                        catColor = false; 
                        settingColor = false;
                        custColor = false;
                      });
                      
                    },
                    title :Row(
                      children: [
                         Text(
                          'Country',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                            shadows: [
                                      Shadow(
                                        color: Colors.brown.shade400,
                                        offset: Offset(2,4),
                                        blurRadius: 8 ),
                                    ]
                            ),
                            ),
                        const SizedBox(width: 25,), 
                        DropdownButton(
                          dropdownColor: Colors.brown[200],
                          style:  TextStyle(fontSize: 12,color: Colors.brown,fontWeight: FontWeight.bold,shadows: [
                                      Shadow(
                                        color: Colors.brown.shade400,
                                        offset: Offset(2,4),
                                        blurRadius: 8 ),
                                    ]),
                          value: dropdownvalue,
                          items: countrylist.map((String countrylist) => DropdownMenuItem(
                            value: countrylist,
                            child: Text(countrylist),)).toList(),
                          onChanged: (String? newValue){
                            setState(() {
                              dropdownvalue=newValue!;
                            });
                          },
                          ) ,
                        
                      ],
                    ),
                      leading:  Icon(Icons.flag_outlined,size: 30,
                      color: Colors.brown,
                      shadows: [
                          Shadow(
                            color:Colors.brown.shade300,
                            blurRadius: 8,
                            offset: Offset(1,3)
                          )
                        ],),
                      ),
                    ),
                  //-----------------------------------------------------------------
                  Padding(padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    title : Text(
                      'LogOut',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        shadows: [
                                      Shadow(
                                        color: Colors.brown.shade400,
                                        offset: Offset(2,4),
                                        blurRadius: 8 ),
                                    ]),
                        ),
                      leading:  Icon(Icons.power_settings_new,size: 30,
                      color: Colors.brown,
                      shadows: [
                          Shadow(
                            color:Colors.brown.shade300,
                            blurRadius: 8,
                            offset: Offset(1,3)
                          )
                        ],),
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
    );
  }
  
}

