import 'dart:async';

import 'package:basics/home_page.dart';
import 'package:basics/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  static const String KEYLOGIN = "Login";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    whereToGo();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> whereToGo() async {

    var sharePref = await SharedPreferences.getInstance();

    var isLoggedIn = sharePref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), (){

      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=> MyHomePage()));
        }
        else{
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=> LoginPage(),));
        }
      }
      else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>LoginPage()));
      }


    }   );
  }
}




