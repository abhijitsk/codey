import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codey/models/database.dart';


class EditProfile extends StatefulWidget{
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final user = FirebaseAuth.instance.currentUser!;

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
    _vloggerId.text.trim());
  }

  Future userDetails(String firstName, String lastName, String areacode,
  String telephone, String emailaddress, String dob, String vloggerid) async{
    try {
      await FirebaseFirestore.instance.collection('EditProfile').doc(user.email).set({
        'first name': firstName,
        'last name' : lastName,
        'area code': areacode,
        'telephone': telephone,
        'email': emailaddress,
        'DOB' : dob,
        'vlogger Id':vloggerid,

    });
      
    } catch (e) {
    }
    

  }

  @override
    void dispose(){
    _firstName.dispose();
    _lastName.dispose();
    _areacode.dispose();
    _telephone.dispose();
    _vloggerId.dispose();
    _dob.dispose();
    _emailaddress.dispose();
      super.dispose();
  }

  @override
    void initState(){
      
    super.initState();
  }

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(
          child:Text('Edit Profile')
      )),
      body: FutureBuilder(
        future: FirestoreData1().getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height:10),
                //-------------------------------------------------------------> ROW1
                Row(
                  
                  children:[
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        
                        controller: _firstName..text=snapshot.data['first name'], //..text='hi',
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
                        controller: _lastName..text = snapshot.data['last name'],
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
              //-------------------------------------------------------------> ROW2
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
                        controller: _areacode..text = snapshot.data['area code'],
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
              
              //-------------------------------------------------------------> ROW4
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
              
              //-------------------------------------------------------------> ROW5
              MaterialButton(
                onPressed: (){},
                color: Colors.grey,
                child: const Text('Update Password'),
                ),

              Text(user.email!),
              Text('Hi'),
              
              
              
              
              

              
              
              //-------------------------------------------------------------> ROW5
              MaterialButton(
                onPressed: (){
                  addData();
                  Navigator.pop(context);
                  
                },
                child: const Text('Update Info'),
                color: Colors.grey,
                ),

                
                ],)
            ),);
        },),
    );
  }
}