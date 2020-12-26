import 'package:flutter/material.dart';
import 'package:examapp/service/auth_service.dart';
import 'package:examapp/widgetProvider/widgetprovider.dart';
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  AuthService authService=AuthService();
  void submit() async {
    try{final auth = Provider.of(context).auth;
    await auth.singOut();
    Navigator.of(context).pushReplacementNamed('/home');}
    catch (e){}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: submit,
          child: Text("logout"),
        ),
      ),
    );
  }
}
