import 'package:flutter/material.dart';
class FooterBanner extends StatefulWidget {
  @override
  _FooterBannerState createState() => _FooterBannerState();
}

class _FooterBannerState extends State<FooterBanner> {
  @override

  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Container(
        width: MediaQuery.of(context).size.width,
       // color: Colors.red,
        height: MediaQuery.of(context).size.height*.3,
       margin: EdgeInsets.only(top: 25.0),

       // child: Text("hello"),
        decoration: BoxDecoration(

          image:DecorationImage(
            fit: BoxFit.cover,
              image: NetworkImage("https://previews.123rf.com/images/wongsalam77/wongsalam771607/wongsalam77160700287/60137480-big-doodles-school-education-vector-art-illustration.jpg")
          ),
        ),
      ),
    );
  }
}
