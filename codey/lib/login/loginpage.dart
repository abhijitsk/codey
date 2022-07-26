import 'package:codey/login/signup.dart';
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


  Future signIn() async {
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
  

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.brown[600],
      body: SafeArea(
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

                      // Box for email address
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color:Colors.blue[50],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child:  Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            controller: _emailController,
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

                    // Box for password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color:Colors.blue[50],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child:  Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
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
                    const SizedBox(height:20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: signIn ,
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
                    const SizedBox(height:20),
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
                    const SizedBox(height:20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          minWidth: MediaQuery.of(context).size.width*0.4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topLeft: Radius.circular(30)
                            ),
                          ),
                          height: 50,
                          color: Colors.brown[400],
                          child:Text(
                            'Google',
                            style: TextStyle(color: Colors.white,
                            fontSize: 15,
                            ),
                          )
                        
                        ),
                        MaterialButton(
                          onPressed: () {},
                          minWidth: MediaQuery.of(context).size.width*0.4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              topRight: Radius.circular(30)
                            ),
                          ),
                          height: 50,
                          color: Colors.brown[400],
                          child:Text(
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
    );
  }

}
