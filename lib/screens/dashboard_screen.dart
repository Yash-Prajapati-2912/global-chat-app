import 'package:chat_app/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>{

  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Text('Welcome,'),
          Text((user?.email ?? "").toString()),
          ElevatedButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();

            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
              return SplashScreen();
            }),(route){
              return false;
            });
          }, child: Text('Logout')),
        ],
      ),
    );
  }
  
}