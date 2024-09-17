import 'package:basics/home_page.dart';
import 'package:basics/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(21.0),
                child: Icon(Icons.account_circle,size: 100,color: Colors.blue,),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)
                  )
                ),
              ),
              SizedBox(height: 7,),
              TextField(
                decoration: InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)
                    )
                ),
              ),
              SizedBox(
                height: 11,
              ),
              ElevatedButton(onPressed: () async {

                var sharePref = await SharedPreferences.getInstance();

                sharePref.setBool(SplashPageState.KEYLOGIN, true);

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
