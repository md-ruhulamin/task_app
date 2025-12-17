import 'package:flutter/material.dart';
import 'package:task_app/widgets/reusable_appbar.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(),
      body: Container(

        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        height: double.maxFinite,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[  Image.asset(
          
              "assets/images/no_data.png"),
          
          SizedBox(height: 20,),
            Text("No data is here,"),
            Text("please wait.")
          
          ]
        ),
      ),


    );
  }
}
