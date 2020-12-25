import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ImageBanner extends StatefulWidget {
  @override
  _ImageBannerState createState() => _ImageBannerState();
}

class _ImageBannerState extends State<ImageBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: Stack(
        children: [
          Container(
            child: Image.network("https://image.freepik.com/free-vector/modern-flat-vector-illustration-concepts-e-learning-online-education_97843-130.jpg"),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape:BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage("https://cdn2.f-cdn.com/contestentries/291988/13879373/562a574229f2c_thumb900.jpg")
                    )
                  ),
                  alignment: Alignment.center,
                 ),
                Container(
                    //alignment: Alignment.topLeft,
                    child: Text("App",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blueAccent
                      ),
                    ))
              ],
            ),
          )

        ],
      ),
    );
  }
}
