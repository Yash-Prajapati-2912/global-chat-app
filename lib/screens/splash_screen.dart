import 'package:chat_app/screens/dashboard_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{


  var user = FirebaseAuth.instance.currentUser;
  
  @override
  void initState() {
    
    Future.delayed(Duration(seconds: 5), (){
      if(user==null){
        openLogin();
      }else{
        openDashboard();
      }
    });
    
    
    super.initState();
  }

  void openDashboard(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return DashboardScreen();
    }));
  }

  void openLogin(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/images/logo.png")),
    );
  }
  
}