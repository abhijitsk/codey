import 'package:codey/main_pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:codey/login/logoutAlert.dart';

class SliderPage extends StatefulWidget{
  const SliderPage({Key? key}) : super(key: key);

 

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
                      children: const [
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
                    icon: const Icon(Icons.arrow_forward_ios),
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
                      MaterialPageRoute(builder: (context)=> Profile()));
                  },
                  title: Text('Profile',
                  style:TextStyle(
                    color: Colors.brown[600],
                    fontWeight: FontWeight.bold)
                    ),
                  leading: const Icon(Icons.person_outline,size: 30,),
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
                },
                title :const Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
                    ),
                  leading: const Icon(Icons.category_outlined,size: 30,),
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
                  });
                },
                title :const Text(
                  'My Favourites',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
                    ),
                  leading: const Icon(Icons.stars_outlined,size: 30,),
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
                },
                title :const Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
                    ),
                  leading: const Icon(Icons.settings_outlined,size: 30,),
                  ),
                ),
              //-----------------------------------------------------------------
              Padding(padding: const EdgeInsets.all(0.0),
              child: ListTile(
                selected: custColor,
                onTap: (){
                    homeColor = false;
                    favourite = false;
                    catColor = false; 
                    settingColor = false;
                    countryColor =false;
                },
                title :const Text(
                  'Customer Service',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
                    ),
                  leading: const Icon(Icons.headset_mic_outlined,size: 30,),
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
                    const Text(
                      'Country',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown),
                        ),
                    SizedBox(width: 25,), 
                    DropdownButton(
                      dropdownColor: Colors.white,
                      style: TextStyle(fontSize: 12,color: Colors.brown,fontWeight: FontWeight.bold),
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
                  leading: const Icon(Icons.flag_outlined),
                  ),
                ),
              //-----------------------------------------------------------------
              Padding(padding: const EdgeInsets.all(0.0),
              child: ListTile(
                title :const Text(
                  'LogOut',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
                    ),
                  leading: const Icon(Icons.power_settings_new),
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

