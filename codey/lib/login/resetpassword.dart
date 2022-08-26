import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:codey/login/loginpage.dart';

class ResetPassword extends StatelessWidget{
   ResetPassword({Key? key}) : super(key: key);
   final _emailController = TextEditingController();


  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.brown[600],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: 
                  [
                    Image.asset('images/icon.png',
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width*0.3,
                    
                    ),

                    const SizedBox(height:40),

                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25 ),),

                    const SizedBox(height:20),

                    const Text(
                      'Please enter the email address'+'\n'+' associated with the account',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),),
                    
                    const SizedBox(height:20),

                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      height: MediaQuery.of(context).size.height*0.085,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:20.0),
                          child: TextField(
                            controller: _emailController,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email_outlined,color: Colors.black,),
                              hintText: 'Enter your email address'

                            ),
                            
                          ) ,),
                      ),


                    ),
                  const SizedBox(height:35),

                  MaterialButton(
                    onPressed: resetPassword,
                    height: 50 ,
                    minWidth: MediaQuery.of(context).size.width*0.4,
                    color: Colors.brown[400],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: const Text('Reset Password',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                  
                  const SizedBox(height : 15),

                  MaterialButton(
                    onPressed: (){
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (BuildContext context)=>const Loginpage()));
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width * 0.4,
                    color: Colors.brown[400],
                    child: const Text('Back to login',
                      style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                    ),
                ]),)
            ]) ,)
          ),
    );
  }
  Future resetPassword() async {
    await FirebaseAuth.instance.
    sendPasswordResetEmail(email: _emailController.text.trim());
  }
}