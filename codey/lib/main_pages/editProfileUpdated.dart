import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../login/loginroute.dart';
import '../models/database.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final user = FirebaseAuth.instance.currentUser!;
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _areacode = TextEditingController();
  final _telephone = TextEditingController();
  final _emailaddress = TextEditingController();
  final _dob = TextEditingController();
  final _vloggerId = TextEditingController();

  Future addData() async {
    userDetails(_firstName.text.trim(), 
    _lastName.text.trim(), 
    _areacode.text.trim(), 
    _telephone.text.trim(), 
    _emailaddress.text.trim(), 
    _dob.text.trim(), 
    _vloggerId.text.trim(),[]);
  }

  Future userDetails(String firstName, String lastName, String areacode,
  String telephone, String emailaddress, String dob, String vloggerid, List fav) async{
    try {
      await FirebaseFirestore.instance.collection('EditProfile').doc(user.email).set({
        'first name': firstName,
        'last name' : lastName,
        'area code': areacode,
        'telephone': telephone,
        'email': emailaddress,
        'DOB' : dob,
        'vlogger Id':vloggerid,
        'fav':fav

    });
     } catch (e) {
      print('object');
    }
    

  }

  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreData().getData(),
      builder: (context,AsyncSnapshot snapshot) {
        if(snapshot.requireData=='empty'){
         return Scaffold(
          body: SafeArea(
            child: Container(
              child: Column(children: [
                SizedBox(height: 10),
                Container(
                  color: Colors.brown,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: const Center(
                      child: Text(
                    'Please update the mandatory details',
                    style: TextStyle(fontSize: 18),
                  )),
                ),
                SizedBox(height: 10),
                Card(
                  elevation: 20,
                  color: Colors.brown[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                        
                        children:[
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              
                              controller: _firstName,
                              decoration: const InputDecoration(
                                labelText: 'First Name',
                                labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: Colors.black),
                                )
                              ),
                            ),),
                          const SizedBox(width:5),

                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: _lastName,
                              decoration: const InputDecoration(
                                labelText: 'Last Name',
                                labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: Colors.black),
                                )
                              ),
                            ),),
                        ]
                      ),
                    const SizedBox(height:10),
                    TextFormField(
                    controller: _emailaddress,
                    decoration: const InputDecoration(
                    labelText: 'Email address',
                    labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black),
                        ) ),),
                  const SizedBox(height:10),
                  //-------------------------------------------------------------> ROW3
                  Row(
                      children:[
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _areacode,
                            decoration: const InputDecoration(
                              labelText: 'Area Code',
                              labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.black),
                              )
                            ),
                          ),),
                        const SizedBox(width:5),

                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            
                            controller: _telephone,
                            decoration: const InputDecoration(
                              labelText: 'Telephone number',
                              labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.black),
                              )
                            ),
                          ),),
                      ]
                    ),
                  
                  const SizedBox(height:10),
                  //-------------------------------------------------------------> ROW4
                  TextFormField(
                    controller: _vloggerId,
                    decoration: const InputDecoration(
                    labelText: 'vlogger ID',
                    labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black),
                        ) ),),
                  

                  const SizedBox(height:10),
                  
                  //-------------------------------------------------------------> ROW5
                   TextField(
                    readOnly: true,
                    controller: _dob,
                    decoration: const InputDecoration(
                    labelText: 'Birthday ',
                    labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black),
                        ),
                        ),
                    onTap: () async{
                      var date = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(), 
                        firstDate: DateTime(1900), 
                        lastDate: DateTime(2100));
                      _dob.text = date.toString().substring(0,10);
                    },
                        ),
                  
                  const SizedBox(height:20),

                  Text(snapshot.requireData.toString()),


                  MaterialButton(
                    onPressed: (){
                      final snackBar = SnackBar(content: Text('User info added')) ;
                      addData();
                      
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Loginroute()));
                      
                    },
                    child: const Text('Update Info'),
                    color: Colors.grey,
                    ),

                  //Text(snapshot.data.id.toString()),
                      ],
                    ),
                  ),
                ),
              ]),
              color: Colors.brown[100],
            ),
          ),
        );

        } 
       // if(snapshot.hasData)
        return Scaffold(
          body: SafeArea(
            child: Container(
              child: Column(children: [
                SizedBox(height: 10),
                Container(
                  color: Colors.brown,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: const Center(
                      child: Text(
                    'Please update the mandatory details',
                    style: TextStyle(fontSize: 18),
                  )),
                ),
                SizedBox(height: 10),
                Card(
                  elevation: 20,
                  color: Colors.brown[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                        
                        children:[
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              
                              controller: _firstName..text=snapshot.data['first name'],
                              decoration: const InputDecoration(
                                labelText: 'First Name',
                                labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: Colors.black),
                                )
                              ),
                            ),),
                          const SizedBox(width:5),

                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: _lastName..text=snapshot.data['last name'],
                              decoration: const InputDecoration(
                                labelText: 'Last Name',
                                labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: Colors.black),
                                )
                              ),
                            ),),
                        ]
                      ),
                    const SizedBox(height:10),
                    TextFormField(
                    controller: _emailaddress..text=snapshot.data['email'],
                    decoration: const InputDecoration(
                    labelText: 'Email address',
                    labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black),
                        ) ),),
                  const SizedBox(height:10),
                  //-------------------------------------------------------------> ROW3
                  Row(
                      children:[
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _areacode..text=snapshot.data['area code'],
                            decoration: const InputDecoration(
                              labelText: 'Area Code',
                              labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.black),
                              )
                            ),
                          ),),
                        const SizedBox(width:5),

                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            
                            controller: _telephone..text=snapshot.data['telephone'],
                            decoration: const InputDecoration(
                              labelText: 'Telephone number',
                              labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.black),
                              )
                            ),
                          ),),
                      ]
                    ),
                  
                  const SizedBox(height:10),
                  //-------------------------------------------------------------> ROW4
                  TextFormField(
                    controller: _vloggerId..text=snapshot.data['vlogger Id'],
                    decoration: const InputDecoration(
                    labelText: 'vlogger ID',
                    labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black),
                        ) ),),
                  

                  const SizedBox(height:10),
                  
                  //-------------------------------------------------------------> ROW5
                   TextField(
                    readOnly: true,
                    controller: _dob..text=snapshot.data['DOB'],
                    decoration: const InputDecoration(
                    labelText: 'Birthday ',
                    labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black),
                        ),
                        ),
                    onTap: () async{
                      var date = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(), 
                        firstDate: DateTime(1900), 
                        lastDate: DateTime(2100));
                      _dob.text = date.toString().substring(0,10);
                    },
                        ),
                  
                  const SizedBox(height:20),


                  MaterialButton(
                    onPressed: (){
                      final snackBar = SnackBar(content: Text('User info added')) ;
                      addData();
                      
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Loginroute()));
                      
                    },
                    child: const Text('Update Info'),
                    color: Colors.grey,
                    ),

                  
                      ],
                    ),
                  ),
                ),
              ]),
              color: Colors.brown[100],
            ),
          ),
        );
      }
    );
  }
}
