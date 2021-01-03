import 'package:examapp/Screens/DashBoard.dart';
import 'package:examapp/Screens/mainScreen.dart';
import 'package:examapp/Screens/signIn.dart';
import 'package:examapp/Screens/singleExamScreen.dart';
import 'package:examapp/Screens/splashScreen.dart';
import 'package:examapp/customAssets/banner.dart';
import 'package:examapp/service/auth_service.dart';
import 'package:examapp/widgetProvider/widgetprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        home: HomeController(),
        routes: <String, WidgetBuilder>{
          "/signUp":(BuildContext context)=>SignIN(authformType: AuthformType.signUp,),
          "/signIn":(BuildContext context)=>SignIN(authformType: AuthformType.signIn,),
          "/home":(BuildContext context)=>HomeController(),
        },
      ),
    );
  }
}
class HomeController extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final AuthService auth=Provider.of(context).auth;
    return StreamBuilder<String>(
        stream: auth.onAuthStateChanged,
        builder: (context, AsyncSnapshot<String> snapshot){
          if(snapshot.connectionState==ConnectionState.active){
            final bool signedIn=snapshot.hasData;
            return signedIn?SingleExamScreen():SignIN();
          }
          return CircularProgressIndicator();
        });

  }
}