import 'package:flutter/material.dart';
class SingleExamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("hello"),
            expandedHeight: 200,

          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((Context, index){
              return Container(
                height: 50,
                color: Colors.red,
                alignment: Alignment.center,
              );
            }),
          )
        ],
      ),
    );
  }
}
