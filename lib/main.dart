import 'package:flutter/material.dart';
import 'package:json_practice/homescreen.dart';
import 'package:provider/provider.dart';

import 'json_posts/json_post_provider.dart';
import 'json_posts/post_Screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostJsonProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(context) => HomeScreen(),
          "posts":(context) => Posts_Screen(),


        },
      ),
    ),
  );
}
