import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginpage.dart';



class SignUp extends StatefulWidget{

  @override

  State<SignUp> createState() => _SignUpState();

}

class _SignUpState extends State<SignUp>{
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();
  final snackBar = SnackBar(content: Text('please enter all information'),);
  final snackBarpass = SnackBar(content: Text('enter same password for both the fields'),);

  
  
  @override


  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.brown[600],
      body: SafeArea(
        child:SingleChildScrollView(
          child: Center(
            child:Column(children: [
              Image.asset(
                'images/icon.png',
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              
              const SizedBox(height: 40),
              // email address box
              Padding(
                padding:EdgeInsets.symmetric(horizontal:25) ,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                     ),
                  child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextField(
                          controller: _email,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),   
                     
                      ),
                ),

              SizedBox(height:15),


              // password text editor
              Padding(
                padding:EdgeInsets.symmetric(horizontal:25) ,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                     ),
                  child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextField(
                          controller: _password,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),   
                     
                      ),
                ),

              SizedBox(height:15),


              // confirm password text editor
              Padding(
                padding:EdgeInsets.symmetric(horizontal:25) ,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                     ),
                  child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextField(
                          controller: _confirmpassword,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                          ),
                        ),
                      ),
                      
                     
                      ),
                ),
              SizedBox(height :15),
              
              // create account button
              MaterialButton(
                onPressed: (){
                  if (_email.text.isNotEmpty &&
                  _password.text.isNotEmpty &&
                  _confirmpassword.text.isNotEmpty){
                    if (_password.text.trim() == 
                    _confirmpassword.text.trim()){
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _email.text.trim(),
                        password: _password.text.trim(),
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(snackBarpass);
                    }
                  }else {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                height: 60,
                minWidth: MediaQuery.of(context).size.width*0.5,
                color: Colors.brown[800],
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                  ),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(height:15),
              
              
              // Button for login Page
              MaterialButton(
                onPressed: (){
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => const Loginpage()));
                },
                height: 60,
                minWidth: MediaQuery.of(context).size.width*0.5,
                color: Colors.brown[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  ),
                child: Text(
                  'Login Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    ),
                ),
                ),
              
            ],),

          ),) ),
    );
  }
}