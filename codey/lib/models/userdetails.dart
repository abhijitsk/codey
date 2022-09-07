import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails extends StatefulWidget{
  const UserDetails({Key? key}) : super(key: key);

  @override
  UserDetailsState createState()=> UserDetailsState();
}

class UserDetailsState extends State<UserDetails>{
  final user = FirebaseAuth.instance.currentUser!;
  DocumentSnapshot doc = FirebaseFirestore.instance.collection('EditProfile').doc().get() as DocumentSnapshot<Object?>;
  
  

  
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _areacode = TextEditingController();
  final _telephone = TextEditingController();
  final _emailaddress = TextEditingController();
  final _dob = TextEditingController();
  final _vloggerId = TextEditingController();

  


  Future<DocumentSnapshot> getdata() async{
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('EditProfile').doc(user.email).get();
      return snapshot;

  }


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
    getdata();
    super.initState();
  }

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Edit Profile'),
        ),
      backgroundColor: Colors.brown,
        ),
      body: SafeArea(
              child: SingleChildScrollView(
          child: Container(
            color: Colors.brown[200],
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                
                const SizedBox(height:10),
                //-------------------------------------------------------------> ROW1
                Row(
                  
                  children:[
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        
                        controller: _firstName..text='hi', //..text='hi',
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
              //-------------------------------------------------------------> ROW2
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
              
              //-------------------------------------------------------------> ROW4
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
              
              //-------------------------------------------------------------> ROW5
              MaterialButton(
                onPressed: (){},
                color: Colors.grey,
                child: const Text('Update Password'),
                ),

              Text(user.email!),
              
              

              
              
              //-------------------------------------------------------------> ROW5
              MaterialButton(
                onPressed: (){
                  addData();
                  
                },
                child: const Text('Update Info'),
                color: Colors.grey,
                ),
              
              


              
              ]),) ),
      ),
    );
  }

}

