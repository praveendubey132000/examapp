import 'package:flutter/material.dart';
class SingleExamScreen extends StatelessWidget {
  final String examName;
  SingleExamScreen(this.examName){
  }
  @override
  Widget build(BuildContext context) {
    TabController controller;

    @override
    void initState() {

      controller = TabController(length: 5,);
    }

    String _Headertitle(){
      if(examName.length<=30){
        return examName;
      }
      else{
        return examName.substring(0,25)+"...";}

    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
           pinned: true,
           // floating: false,

            leading:  IconButton(
              onPressed: ()=>{},
             splashColor: Colors.green,
              splashRadius: 10.0,
              iconSize: 40.0,

              icon: Icon(Icons.arrow_left,color: Colors.white),
            ),
            actions: [
              IconButton(
                iconSize: 30.0,

                icon: Icon(Icons.call_made_sharp,color: Colors.white),
              ),
              IconButton(
                iconSize: 30.0,
                icon: Icon(Icons.bookmark,color: Colors.white),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle:true,
              title: Flexible(

                  child: Text(_Headertitle(),overflow: TextOverflow.ellipsis,)),

            ),
            expandedHeight: 200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20))
            ),
         /*  bottom:   DefaultTabController(
             length: 5,
             child:TabBar(tabs: [
               Tab(text: "About"),
               Tab(text: "Topics Coverd"),
               Tab(text: "Resource Material"),
               Tab(text: "Friends Attempting"),
               Tab(text: "T&C")
             ],) ,
           );
          ),*
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index){

              return
                DefaultTabController(
                length: 5,
                child:TabBar(tabs: [
                  Tab(text: "About"),
                  Tab(text: "Topics Coverd"),
                  Tab(text: "Resource Material"),
                  Tab(text: "Friends Attempting"),
                  Tab(text: "T&C")
                ],) ,
              );
            }),
          )
        ],

      ),
    );
  }
}
