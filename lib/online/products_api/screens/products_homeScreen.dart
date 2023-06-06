
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_practice/online/products_api/screens/product_database.dart';
import 'package:sizer/sizer.dart';

class Home_Products extends StatefulWidget {
  const Home_Products({Key? key}) : super(key: key);

  @override
  State<Home_Products> createState() => _Home_ProductsState();
}

class _Home_ProductsState extends State<Home_Products> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Shopping_Database(),

        bottomNavigationBar: BottomNavigationBar(

          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,

          iconSize: 25.sp,
          selectedIconTheme: IconThemeData(color: Colors.black),
          selectedLabelStyle: TextStyle(fontSize: 12.sp),
          unselectedIconTheme: IconThemeData(color: Colors.black38),
          unselectedLabelStyle: TextStyle(fontSize: 12.sp),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black38,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded,),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded),label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.card_travel_rounded),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: "Settings"),
          ],
        ),
      ),
    );
  }
}
