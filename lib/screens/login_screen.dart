import 'package:chat_app/controller/login_controller.dart';
import 'package:chat_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  var userForm = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: userForm,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/images/logo.png")),

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,

                controller: email,

                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Email is Required";
                  }
                },

                decoration: InputDecoration(
                  label: Text('Email'),
                ),
              ),

              SizedBox(height: 22,),

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,


                controller: password,

                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Password is Required";
                  }
                },

                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                  label: Text('Password'),
                ),
              ),

              SizedBox(height: 22,),

              Row(
                children: [
                  Expanded(
                    
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(0,50),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.deepPurple
                        ),
                        onPressed: (){
                    
                      if(userForm.currentState!.validate()){
                        LoginController.login(context: context, email: email.text, password: password.text);
                      }
                    
                    }, child: Text('Login')),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('Don\'t have an account?'),
                  SizedBox(width: 5,),
                  InkWell(
                      onTap: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                          return SignupScreen();
                        }),(route){
                          return false;
                        });
                      },
                      child: Text('Create now',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
}