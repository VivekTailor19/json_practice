import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_practice/homescreen.dart';
import 'package:json_practice/json_people/screen/peopleDatabase.dart';
import 'package:json_practice/json_products/products_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'json_cart/cartDatabase.dart';
import 'json_cart/cartprovider.dart';
import 'json_people/provider/peopleprovider.dart';
import 'json_people/screen/person_view.dart';
import 'json_posts/json_post_provider.dart';
import 'json_posts/post_Screen.dart';
import 'json_products/products_provider.dart';
import 'json_users/json_user_provider.dart';
import 'json_users/user_Screen.dart';

void main() {
  runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) =>
           Sizer(
             builder: (context, orientation, deviceType) => MultiProvider(
               providers: [
                  ChangeNotifierProvider(create: (context) => PostJsonProvider(),),
                  ChangeNotifierProvider(create: (context) => UserJsonProvider(),),
                  ChangeNotifierProvider(create: (context) => PeopleProvider(),),
                  ChangeNotifierProvider(create: (context) => CartProvider(),),
                  ChangeNotifierProvider(create: (context) => ProductsProvider(),),
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
                    "products":(context) => Products_DashBoard()

            },
          ),
        ),
      ),
     // ),
  );
}
