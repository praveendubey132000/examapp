import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: Image.network("https://image.freepik.com/free-vector/modern-flat-vector-illustration-concepts-e-learning-online-education_97843-130.jpg"),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text("Hello".toUpperCase(),style: TextStyle(
                        fontSize: 50,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text("Welcome to Exam System",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.blueAccent
                        ),
                        ))
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    ); }
}
