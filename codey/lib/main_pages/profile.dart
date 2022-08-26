import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget{
  @override
  _UserDetailsState createState()=> _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails>{
  final _dateController = TextEditingController();
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Edit Profile'),
        ),
      backgroundColor: Colors.brown,
        ),
      body: SafeArea(
              child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height:10),
                //-------------------------------------------------------------> ROW1
                Row(
                  children:[
                    const Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.black),
                          )
                        ),
                      ),),
                    const SizedBox(width:5),

                    const Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
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
              const TextField(decoration: InputDecoration(
                labelText: 'Email address',
                labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.black),
                    ) ),),
              SizedBox(height:10),
              //-------------------------------------------------------------> ROW3
              Row(
                  children:[
                    const Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Area Code',
                          labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.black),
                          )
                        ),
                      ),),
                    const SizedBox(width:5),

                    const Expanded(
                      flex: 4,
                      child: TextField(
                        decoration: InputDecoration(
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
              
              SizedBox(height:10),
              //-------------------------------------------------------------> ROW4
              const TextField(decoration: InputDecoration(
                labelText: 'vlogger ID',
                labelStyle: TextStyle(color: Colors.brown,fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.black),
                    ) ),),
              

              SizedBox(height:10),
              
              //-------------------------------------------------------------> ROW4
               TextField(
                readOnly: true,
                controller: _dateController,
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
                  _dateController.text = date.toString().substring(0,10);
                },
                    ),
              
              SizedBox(height:20),
              
              //-------------------------------------------------------------> ROW5
              MaterialButton(
                onPressed: (){},
                child: Text('Update Password'),
                color: Colors.grey,
                ),

              ]),) ),
      ),
    );
  }

}