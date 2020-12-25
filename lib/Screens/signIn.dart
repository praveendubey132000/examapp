import 'package:examapp/customAssets/banner.dart';
import 'package:examapp/customAssets/footerBanner.dart';
import 'package:examapp/customAssets/customSigninButton.dart';
import 'package:flutter/material.dart';
enum formType{
  signIn,signUp
}
class SignIN extends StatefulWidget {
  @override
  _SignINState createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  final _formKey=GlobalKey<FormState>();
  bool _isChecked =false;
  void onChanged(bool value)
  { print(value);
  setState(() {

    _isChecked=value;
  });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children:[ Container(
            child: Column(
              children: [
                ImageBanner(),
                Text("Sign In",style: TextStyle(
                  fontSize: 25
                ),),
                Form(key:_formKey,
                child: Container(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: buildTextFormField() +buildButton()  /*[

                    /*  Text("Username"),

                      SizedBox(
                        height: 20,
                      ),
                      Text("Password"),
                      TextFormField(
                        decoration: InputDecoration(

                          hintText: "Enter passward"
                        ),
                      ),
                      RaisedButton(child: Text(
                        "SignIn"
                      ),),
                      CustomSignInButton()*/
                    ],*/
                  ),
                ),
                ),
                //Stack(children:buildOauthButton()+[FooterBanner()])
                Stack(children: [
                  FooterBanner(),
                  Column(

                    children: buildOauthButton(),
                  ),
                  Column(children: buildSwitchTextButton())



                ],

                )


              ],
            ),

          ),
        ]),
      ),
    );
  }
// login ,remember me and forget password
  List<Widget> buildButton(){
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
              child: Text("Sign in",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600),),
            ),
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
    String _text;
     textButton(){
      return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 125.0),
          child: RichText(

            text: TextSpan(text:"Don't have account?",style: TextStyle(shadows: [Shadow(
              offset: Offset(0, 1.0),
              blurRadius: 2.0,
              color: Color.fromARGB(250, 0, 0, 0),
            ),],color: Colors.black),
                children: [
                  TextSpan( text: "SignUp",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))
                ]),

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
    textfield.add(Text("Username"));
    textfield.add( TextFormField(
      decoration: InputDecoration(


          hintText: "Enter username"
      )
    ));
    textfield.add(SizedBox(height: 20.0,));
    textfield.add(Text("Password"));

    textfield.add( TextFormField(
      obscureText: true,
        decoration: InputDecoration(


            hintText: "password",

        )
    ));
    return textfield;
  }
}

