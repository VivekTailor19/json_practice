import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(onTap: () => Navigator.pushNamed(context, "airline"),child: Tabs("Airlines")),
          ],
        ),
      ),
    );
  }
  Widget Tabs(String? title)
  {
    return Container(
      height: 3.h,width: 35.w,
      alignment: Alignment.center,
      child: Text("$title",style: TextStyle(color: Colors.white,fontSize:15.sp ),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        gradient: LinearGradient(colors: [Colors.indigo,Colors.lightBlueAccent],)
      ),
    );
  }
}
