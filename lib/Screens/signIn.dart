import 'package:examapp/customAssets/banner.dart';
import 'package:examapp/customAssets/footerBanner.dart';
import 'package:examapp/customAssets/customSigninButton.dart';
import 'package:flutter/material.dart';
import 'package:examapp/widgetProvider/widgetprovider.dart';
import 'package:examapp/service/auth_service.dart';
enum AuthformType{
  signIn,signUp
}
class SignIN extends StatefulWidget {
  final AuthformType authformType;
  SignIN({Key key,@required this.authformType}):super(key:key);
  @override
  _SignINState createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  AuthformType authformType;
  _SignINState({this.authformType});
  String _switchButtonText,_headerText,_newFormState,_submitButtonText,_switchButtonSpanText,_email,_password,_name;
  String _firstName,_lastName,_photoUrl ;
  @override



  final formKey=GlobalKey<FormState>();
  void switchFormState(String state) {
    formKey.currentState.reset();
    if (state == "signUp") {
      setState(() {
        authformType = AuthformType.signUp;
      });
    } else {
      setState(() {
        authformType = AuthformType.signIn;
      });
    }
  }
  bool _isChecked =false;
  void onChanged(bool value)
  { print(value);
  setState(() {

    _isChecked=value;
  });

  }
  void submit() async {
    final form = formKey.currentState;
    form.save();
    try {
      final auth = Provider.of(context).auth;
      if(authformType == AuthformType.signIn) {
        String uid = await auth.singInWithEmailAndPassword(_email, _password);
        print("Signed In with ID $uid");
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        String uid = await auth.creatUserWithEmailAndPassword(_email, _password, _firstName, _lastName, _photoUrl);
        print("Signed up with New ID $uid");
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      print (e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children:[ Container(
            child: Column(
              children: [
                ImageBanner()
                ,buildHeaderText(),
                Form(
                  key:formKey, child: Container(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: buildTextFormField() +buildButton() 
                  ),
                ),
                ),
                Stack(children: [
                  FooterBanner(),
                  Column(children: buildOauthButton(),),
                  Column(children: buildSwitchTextButton())],)],
            ),
          ),
        ]),
      ),
    );
  }
// login ,remember me and forget password
  List<Widget> buildButton(){
    if(authformType==AuthformType.signIn){
      _submitButtonText="Sign In";


    }
    else{
      _submitButtonText="Sign Up";



    }


    return [Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Container(

          child: RaisedButton(
            color: Colors.blueAccent,
            disabledColor: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_submitButtonText,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600),),
            ),
            onPressed: submit,
          ),
        ),
        Row(
          children: [
            Row(children: [Checkbox(
              value: _isChecked,
              onChanged: (value){onChanged(value);           }
            ),
              FlatButton(
                onPressed: (){
                  if(_isChecked==false){
                    onChanged(true);
                  }
                  else{
                    onChanged(false);
                  }
                },
                  child: Text("Remember me")
              )

            ],),
            FlatButton(
              onPressed: (){

              },
              child: Text("Forget password?"),
            )
          ],
        )
      ],),
    )];
    //Button.add(R)
    
  }
  List<Widget> buildSwitchTextButton(){
    if(authformType==AuthformType.signIn){
      _submitButtonText="Sign In";
      _switchButtonSpanText="SignUp";
      _switchButtonText="Don't have an Account?";
      _newFormState="signUp";

    }
    else{
      _submitButtonText="Sign Up";
      _switchButtonSpanText="SignIn";
      _switchButtonText="Already have an Account?";
      _headerText="Sign Up";
      _newFormState="SignIn";

    }

     textButton(){
      return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 125.0),
          child: FlatButton(
            onPressed: (){
              switchFormState(_newFormState);
            },
            child: RichText(

              text: TextSpan(text:_switchButtonText,style: TextStyle(shadows: [Shadow(
                offset: Offset(0, 1.0),
                blurRadius: 2.0,
                color: Color.fromARGB(250, 0, 0, 0),
              ),],color: Colors.black),
                  children: [
                    TextSpan( text: _switchButtonSpanText,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))
                  ]),

            ),
          )
      );
    }
    return [textButton()];

  }
  //create google and facebook button
  List <Widget>buildOauthButton(){
    List <Widget> oauthButton;
   InkWell customAuthButton( String _label,String _image,Color _color){
      return InkWell(
        onTap: (){
          print("i click");

        },
        splashColor: Colors.grey,
        autofocus: true,
        //highlightColor: Colors.black12,
        child: Container(
          //color: Colors.red,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _color,
          ),

          height: 50.0,
          width: 120,


          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(

                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(_image),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Text(
                  _label,
                  style: TextStyle(fontSize: 13, color: Colors.white),
                )
              ],
            ),
          ),

        ),

      );
    }
    return [Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        customAuthButton("Signin","https://e7.pngegg.com/pngimages/670/159/png-clipart-facebook-logo-social-media-facebook-computer-icons-linkedin-logo-facebook-icon-media-internet.png",Colors.blue),
      customAuthButton( "Signin","https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/evolving_google_identity_videoposter_006.jpg",Colors.red)

    ])];
  }
  //create textfields
  List <Widget> buildTextFormField() {
    List<Widget> textfield=[];
    if(authformType==AuthformType.signIn){
      textfield.add(Text("Username"));
      textfield.add(TextFormField(
        onSaved: (value){
          _email=value;

        },
          decoration: InputDecoration(


              hintText: "Enter username"
          )
      ));
      textfield.add(SizedBox(height: 20.0,));
      textfield.add(Text("Password"));
      textfield.add( TextFormField(
          obscureText: true,
          onSaved: (value)=>{_password=value},
          decoration: InputDecoration(


            hintText: "password",

          )
      ));

    }
    else {

      textfield.add(Text("Enter First Name"));
      textfield.add( TextFormField(
          onSaved: (value)=>{_firstName=value},
          decoration: InputDecoration(
              hintText: "Enter First Name"
          )
      ));
      textfield.add(SizedBox(height: 20.0,));
      textfield.add(Text("Enter Last Name"));
      textfield.add( TextFormField(
          onSaved: (value)=>{_lastName=value},
          decoration: InputDecoration(
              hintText: "Enter Last Name"
          )
      ));
      textfield.add(SizedBox(height: 20.0,));
      textfield.add(Text("Enter Email"));
      textfield.add( TextFormField(
          onSaved: (value)=>{_email=value},
          decoration: InputDecoration(
              hintText: "Enter Email"
          )
      ));
      textfield.add(SizedBox(height: 20.0,));
      textfield.add(Text("Enter Password"));
      textfield.add( TextFormField(
          onSaved: (value)=>{_password=value},
          obscureText: true,
          decoration: InputDecoration(


            hintText: "password",

          )
      ));
      textfield.add(SizedBox(height: 20.0,));
      textfield.add(Text("Confirm Password"));
      textfield.add( TextFormField(
          obscureText: true,
          decoration: InputDecoration(


            hintText: "confirm password",

          )
      ));
    }

    return textfield;
  }


  Text buildHeaderText(){
    if(authformType==AuthformType.signIn) {
      _headerText = "Sign In";
    }
    else{
      _headerText="Sign Up";
    }
    return Text(_headerText,style: TextStyle(
        fontSize: 25
    ));
  }
}

