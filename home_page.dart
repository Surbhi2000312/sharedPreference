import 'package:basics/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Home"),)),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.home,
                color: Colors.white.withOpacity(0.5),
                size: 200,
              ),
              TextButton(onPressed: () async {
                var sharePref = await SharedPreferences.getInstance();


                sharePref.setBool(SplashPageState.KEYLOGIN, false);

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));

              }, child: Text("LogOut")),
            ],
          ),
        ),
      ),
    );
  }
}