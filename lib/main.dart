import 'package:flutter/material.dart';
import 'package:json_practice/homescreen.dart';
import 'package:json_practice/json_people/screen/peopleDatabase.dart';
import 'package:provider/provider.dart';

import 'json_cart/cartDatabase.dart';
import 'json_cart/cartprovider.dart';
import 'json_people/provider/peopleprovider.dart';
import 'json_people/screen/person_view.dart';
import 'json_posts/json_post_provider.dart';
import 'json_posts/post_Screen.dart';
import 'json_users/json_user_provider.dart';
import 'json_users/user_Screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostJsonProvider(),),
        ChangeNotifierProvider(create: (context) => UserJsonProvider(),),
        ChangeNotifierProvider(create: (context) => PeopleProvider(),),
        ChangeNotifierProvider(create: (context) => CartProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //initialRoute: "posts",
        routes: {
          "/":(context) => HomeScreen(),
          "posts":(context) => Posts_Screen(),
          "users":(context) => Users_Screen(),
          "people":(context) => People_DataBase(),
          "person":(context) => Person_View(),
          "cart":(context) => Cart_DataBase(),

        },
      ),
    ),
  );
}
