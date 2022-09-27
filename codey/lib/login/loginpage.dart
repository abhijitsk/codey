import 'package:codey/login/signup.dart';
import 'package:codey/login/resetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget{
  const Loginpage({Key? key}) : super(key: key);

  @override
  
  State<Loginpage> createState() => _LoginPage();
  
}

class _LoginPage extends State<Loginpage> {
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _key= GlobalKey<FormState>();

  Future signIn()async  {

    
      await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailController.text.trim(), 
    password: _passwordController.text.trim(),);
    
    
  }

  
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.brown[600],
      body: Form(
          key:_key,
              child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children:[
                Center(
                  child: Column(
                    children:[
                      Image.asset('images/icon.png',
                      height: MediaQuery.of(context).size.height*0.3,
                      width:MediaQuery.of(context).size.width*0.3,
                      ),
                      const SizedBox(
                        height: 40,
                        ),

                        // Box for email address------------------------------------------------------------->
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color:Colors.blue[50],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child:  Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              controller: _emailController,
                              validator: validateEmail,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                
                              ),

                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        ),

                      // Box for password ------------------------------------------------------------->
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color:Colors.blue[50],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child:  Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              validator: validatePassword,
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Box for login button ------------------------------------------------------------->
                      const SizedBox(height:20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: MaterialButton(
                          onPressed:()async{
                            const snackBarUserNotFound = SnackBar(
                              elevation: 20,
                              backgroundColor: Colors.black,
                              content: Text('Either email address or the password entered is incorrect')); 
                            
                            if(_key.currentState!.validate()){
                              try{
                                await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: _emailController.text.trim(), 
                                  password: _passwordController.text.trim(),);
                              }on FirebaseAuthException catch(e){
                                ScaffoldMessenger.of(context).showSnackBar(snackBarUserNotFound);
                              }


                            }else{
                              print('hi');
                            }

                          }
                          
                            
                           ,
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration:  BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(12),
                              ),
                            child:const Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  ),
                                
                                )
                                ),
                          ),
                        ),
                      ),
                      // box for reset password------------------------------------------------------------->
                      const SizedBox(height:20),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                           MaterialPageRoute(builder: (context) => ResetPassword()));
                        },
                        child: const Text(
                          'Forgot Password. Click to reset',
                          style: TextStyle(fontWeight: FontWeight.bold
                        ),
                        ),
                      ),

                      const SizedBox(height:30),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                           MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: const Text(
                          'Not a member, Sign Up',
                          style: TextStyle(fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                      //------------------------------------------------------------->
                      const SizedBox(height:20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width*0.4,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30)
                              ),
                            ),
                            height: 50,
                            color: Colors.brown[400],
                            child:const Text(
                              'Google',
                              style: TextStyle(color: Colors.white,
                              fontSize: 15,
                              ),
                            )
                          
                          ),
                          MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width*0.4,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30)
                              ),
                            ),
                            height: 50,
                            color: Colors.brown[400],
                            child:const Text(
                              'Facebook',
                              style: TextStyle(color: Colors.white,
                              fontSize: 15,
                              ),
                            )
                          
                          )
                          
                        ],)

                    ]
                  ),
                ),
              ]
            )
            )
          ),
      ),
    );
  }

}



String? validateEmail(String? formEmail){
  
  if(formEmail==null || formEmail.isEmpty){
    return 'Email address is required';
    
  }
    String pattern =r'\w+@\w+\.\w' ;
    RegExp regex = RegExp(pattern);
    if(!regex.hasMatch(formEmail)){
      return 'Invalid Email format';
    }
  return null;
  
}

String? validatePassword(String? formPassword){
  if(formPassword==null || formPassword.isEmpty){
    return 'Password is required';
  }
  
  //String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  return null;
}