import 'package:examapp/Screens/singleExamScreen.dart';
import 'package:flutter/material.dart';
class AssignedExamScreen extends StatelessWidget {
  final List itmeList=['Exam','Discussions','Marks','Teachers'];
  final List ExamitmeList=['Exam1','Exam2','Exam3','Exam4'];
  final List ExamTopics=["Topic 1","Topic 2","Topic 3",];
  @override
  Widget build(BuildContext context) {
    
    /*return Container(
        height:MediaQuery.of(context).size.height,
       // padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: ExamitmeList.length,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap: ()=>{print(ExamitmeList[index])},
                    child: Card(
                      margin: EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                          color: Colors.blueAccent,
                        ),
                        //height: MediaQuery.of(context).size.height*0.1,
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
          ],
        ),
      );*/
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height*0.8,
        child: Expanded(
          child: ListView.builder(

            scrollDirection: Axis.vertical,
            itemCount: ExamitmeList.length,
            itemBuilder: (BuildContext context,int index){
              return GestureDetector(
                onTap: ()=>{
                  print(ExamitmeList[index]),
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SingleExamScreen(ExamitmeList[index])))
                },
                child: Card(
                  margin: EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.blue[200*(index+1)],
                    ),
                    height: MediaQuery.of(context).size.height*0.2,
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
      ),
    );
  }
}
