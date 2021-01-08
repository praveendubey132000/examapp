import 'package:examapp/widgetProvider/widgetprovider.dart';
import 'package:flutter/material.dart';
class SideBarScreen extends StatefulWidget {
  @override
  _SideBarScreenState createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: SafeArea(
        child: Column(
          children: [
           FlatButton(

             onPressed: (){
               final auth=Provider.of(context).auth;
               auth.singOut();

             },
             child: Text("SignOut"),)
          ],
        ),
      ),
    );
  }
}
