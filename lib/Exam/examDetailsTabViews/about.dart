import 'package:flutter/material.dart';
import 'package:examapp/Model/examDetails.dart';
class AboutTab extends StatefulWidget {
  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> with AutomaticKeepAliveClientMixin {
  //ExamDetails examDetails;

  String ExamName="deom";

  String ExamDate="Tuesday,12 December 2019";

  String ExamTime="03:00 PM to 05:00 PM";

  String ExamDescription="the quick brown";

  List Tags=["google","facebook","typescript"];

@override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {



    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(

              children: [Icon(Icons.access_time_rounded),SizedBox(width: 20,),Column(children: [Text(ExamDate),Text(ExamTime)],)],
            ),
          ),
          Container(
            child: Row(
              children: [Icon(Icons.details),SizedBox(width: 20,),Wrap(children:[ Column(children: [Text("Description",textAlign: TextAlign.start,),Text(ExamDescription)],)])],
            ),
          ),
          Container(
            child: Row(
              children: [Icon(Icons.toys),SizedBox(width: 20,),Column(children: [Text("Tags"),],)],
            ),
          ),
          Container(
            child: Row(
              children: [Icon(Icons.score_outlined),SizedBox(width: 20,),Column(children: [Text("Your Score"),Text("Not Yet Appeared for Exam")],)],
            ),
          ),
          Customb
        ],
      ),
    );
  }
}
