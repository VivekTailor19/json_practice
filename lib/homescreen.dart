import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {

              },
              child: HomeOptions("Users")
            ),


            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "posts");
              },
              child: HomeOptions("Posts")
            )
          ],
        ),
      ),
    );
  }

  Widget HomeOptions(String optname)
  {
    return Container(height: 60,width: 150,
      alignment: Alignment.center,
      child: Text("$optname"),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),gradient: LinearGradient(colors: [Colors.amber,Colors.white,Colors.green,Colors.indigo])),);
  }
}
