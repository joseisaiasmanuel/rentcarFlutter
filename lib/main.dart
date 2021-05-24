import 'package:flutter/material.dart';
import 'package:rentcar/screen/person_screen.dart';


void main()=> runApp(MyApp());

class MyApp extends StatefulWidget {
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor:Colors.white,
    
      
      
      ),
      
      home: LoginPage(),
     
     
    );
  }
}