import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentcar/screen/person_screen.dart';
import 'package:rentcar/utilizador/user_manager.dart';


void main()=> runApp(MyApp());

class MyApp extends StatefulWidget {
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
           
           providers: [
             ChangeNotifierProvider(
               create: (_) => UserManager(),
               lazy: false,
            )
           ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor:Colors.white,
      
        
        
        ),
        
        home: LoginPage(),
       
       
      ),
    );
  }
}