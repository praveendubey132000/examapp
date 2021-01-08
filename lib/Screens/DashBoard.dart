import 'package:examapp/Screens/assignedExamScreen.dart';
import 'package:examapp/customAssets/footerBanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:examapp/service/auth_service.dart';
import 'package:examapp/widgetProvider/widgetprovider.dart';
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  AuthService authService=AuthService();
  double xAxis=0;
  double yAxis=0;
  double ScaleFactor=1;
  double DashBoardradius=0;
  bool isCollapsed=false;
  double deviceHeightSize;
  double devicewidthSize;
  dynamic _screens;
  String _headerName=" ";


  final List itmeList=['Exam','Discussions','Marks','Teachers'];
  final List ExamitmeList=['Exam1','Exam2','Exam3','Exam4'];
  final List ExamTopics=["Topic 1","Topic 2","Topic 3",];

  /*_DashBoardState(){
    deviceHeightSize=MediaQuery.of(context).size.height;
    devicewidthSize=MediaQuery.of(context).size.width;
  }*/

 /* void submit() async {
    try{final auth = Provider.of(context).auth;
    await auth.singOut();
    Navigator.of(context).pushReplacementNamed('/home');}
    catch (e){}
  }*/
 @override

 void submit(){
   isCollapsed=!isCollapsed;
   if(isCollapsed)
     {
       setState(() {
         xAxis=MediaQuery.of(context).size.width*.5;
         yAxis=MediaQuery.of(context).size.height*.05;
         ScaleFactor=MediaQuery.of(context).size.width*.002+0.13;
         DashBoardradius=10;
         _screens= buildUserProfile();

       });

     }
   else{
     setState(() {
       xAxis=0;
       yAxis=0;
       ScaleFactor=1;
       DashBoardradius=0;
     });

   }

 }



  @override
  Widget build(BuildContext context) {
    return
      AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(10),
          color: Colors.white,

        ),
        duration: Duration(milliseconds: 250),
          transform: Matrix4.translationValues(xAxis,yAxis,0)..scale(ScaleFactor),
          alignment: Alignment.center,
          child:Padding(
            padding: const EdgeInsets.all(8),
            child:  Container(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Stack(
                  children:[

                    //footer
                    buildFooterSection(),


                    Column(

                    children: [
                      //menu bar
                      buildTopNavBar(),
                      // profile Container

                      _screens==null?buildUserProfile():_screens

                   ],

                  ),


                ]),
            ),
          )
        );
  }

  SingleChildScrollView buildUserProfile() {
    return SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [CircleAvatar(
                            backgroundImage: NetworkImage("https://img.mensxp.com/media/content/2020/May/Nawazuddin-Siddiqui-Stole-The-Thunder-From-The-Lead-Actor-In-The-Movie-1200x900_5ec789f6130db_1200x900.jpeg"),
                            radius: 25,
                          ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(child: Text("Nawazuddin Siddiqui",style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),),
                                Container(child: Text("RD Engineering ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 11),),),
                                Container(child: Text("Masters in Computer Applications",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 11)),)
                              ],),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        border: Border.all(color: Colors.black)
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                          children: [TextSpan(style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),text: "40"),
                                            TextSpan( style: TextStyle(color: Colors.black,),text: "Assigned")
                                          ]
                                      ),
                                    )),
                                SizedBox(height: 5,),
                                Container(
                                    padding: EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        border: Border.all(color: Colors.black)
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                          children: [TextSpan(style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),text: "40"),
                                            TextSpan( style: TextStyle(color: Colors.black,),text: "Assigned")
                                          ]
                                      ),
                                    )),

                              ],),
                            //IconButton(icon: Icon(Icons.edit_outlined),)
                          ],
                        ),
                      ),
                      //User greeting name
                      Container(alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(text: TextSpan( style: TextStyle(color: Colors.black),
                                children: [TextSpan(text: "hello,".toUpperCase(),style: TextStyle(fontSize:25,fontWeight: FontWeight.w300)),
                                  TextSpan(text: "Nawazuddin!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))]
                            ),)
                          ],
                        ),
                      ),
                      // deshdborad tiles
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector
                            (
                            child: Container(
                              padding: EdgeInsets.all(5),
                              height: 100,
                              width: 180,
                              margin: EdgeInsets.only(top:5,bottom: 5,left: 2,right: 2),
                              color: Colors.lightBlue,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(



                                    alignment: Alignment.bottomLeft,
                                    child: Text("hello",style:TextStyle(fontSize:28),),
                                  ),
                                  Container(


                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.bookmark,color: Colors.white,),
                                  )

                                ],
                              ),
                            ) ,
                          ),
                          GestureDetector
                            (
                            child: Container(
                              padding: EdgeInsets.all(5),
                              height: 100,
                              width: 180,
                              margin: EdgeInsets.only(top:5,bottom: 5,left: 2,right: 2),
                              color: Colors.lightBlue,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(



                                    alignment: Alignment.bottomLeft,
                                    child: Text("hello",style:TextStyle(fontSize:28),),
                                  ),
                                  Container(


                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.bookmark,color: Colors.white,),
                                  )

                                ],
                              ),
                            ) ,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector
                            (
                            child: Container(
                              padding: EdgeInsets.all(5),
                              height: 100,
                              width: 180,
                              margin: EdgeInsets.only(top:5,bottom: 5,left: 2,right: 2),
                              color: Colors.lightBlue,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(



                                    alignment: Alignment.bottomLeft,
                                    child: Text("hello",style:TextStyle(fontSize:28),),
                                  ),
                                  Container(


                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.bookmark,color: Colors.white,),
                                  )

                                ],
                              ),
                            ) ,
                          ),
                          GestureDetector
                            (
                            child: Container(
                              padding: EdgeInsets.all(5),
                              height: 100,
                              width: 180,
                              margin: EdgeInsets.only(top:5,bottom: 5,left: 2,right: 2),
                              color: Colors.lightBlue,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(



                                    alignment: Alignment.bottomLeft,
                                    child: Text("hello",style:TextStyle(fontSize:28),),
                                  ),
                                  Container(


                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.bookmark,color: Colors.white,),
                                  )

                                ],
                              ),
                            ) ,
                          ),
                        ],
                      ),
                      // recent Assigned tests card

                      Container(
                        height: 200,

                        child: Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: ExamitmeList.length,
                            itemBuilder: (BuildContext context,int index){
                              return GestureDetector(
                                onTap: ()=>{print(ExamitmeList[index])},
                                child: Card(
                                  color: Colors.blueAccent,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.topLeft,
                                    width: MediaQuery.of(context).size.width*.9+10,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        //Exam Title
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [Text(ExamitmeList[index],style:TextStyle(fontWeight: FontWeight.w400,fontSize: 25, color: Colors.white) ,),
                                          Text("Company Brand Name",style: TextStyle(color: Colors.white),)
                                          ],),
                                        //Exam date and topics
                                        Column(

                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                          RichText(
                                            textWidthBasis: TextWidthBasis.longestLine,
                                            text: TextSpan(
                                            children: [
                                              TextSpan(text: "Date:"),
                                              TextSpan(text: "${DateTime.now()}",style: TextStyle(fontWeight: FontWeight.bold))
                                            ],),),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                textWidthBasis: TextWidthBasis.longestLine,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(text: "Based On:"),
                                                    TextSpan(text: "${ExamTopics}",style: TextStyle(fontWeight: FontWeight.bold))
                                                  ],),),
                                              Text("intermediate".toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),  )
                                            ],
                                          )
                                        ],),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },

                          ),
                        ),
                      )



                    ]),
                  );
  }

  Row buildTopNavBar() {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(icon: Icon(Icons.menu),
                      onPressed: (){
                        submit();
                      },
                      ),
                      Text(_headerName),
                      IconButton(icon: Icon(Icons.search),
                        onPressed: submit,
                      )


                    ],
                  );
  }

  Container buildFooterSection() {
    return Container(

                    child: Stack(children:[
                      Container(
                          alignment: Alignment.bottomCenter,
                          child: FooterBanner()),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FlatButton(disabledTextColor: Colors.blue,
                                onPressed: (){setState(() {
                                  _screens=AssignedExamScreen();
                                  _headerName="Assigned Exams";
                                });
                                },
                                child: Text("Assigned Test",style: TextStyle(color: Colors.black,fontSize: 10),),),
                              FlatButton(child: Text("Featured Topics",style: TextStyle(color: Colors.black,fontSize: 10),),),
                              FlatButton(child: Text("Resources",style: TextStyle(color: Colors.black,fontSize: 10),),),
                              FlatButton(child: Text("Mock Test",style: TextStyle(color: Colors.black,fontSize: 10),),),
                            //  FlatButton(child: Text("Live Sessions",style: TextStyle(color: Colors.black,fontSize: 10),),)
                            ],
                          ),
                        ),
                      ),





                    ]));
  }

}
