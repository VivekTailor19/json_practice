
import 'package:flutter/material.dart';
import 'package:json_practice/homescreen.dart';
import 'package:json_practice/offline/json/json_cart/cartDatabase.dart';
import 'package:json_practice/offline/json/json_cart/cartprovider.dart';
import 'package:json_practice/offline/json/json_people/provider/peopleprovider.dart';
import 'package:json_practice/offline/json/json_people/screen/peopleDatabase.dart';
import 'package:json_practice/offline/json/json_people/screen/person_view.dart';
import 'package:json_practice/offline/json/json_posts/json_post_provider.dart';
import 'package:json_practice/offline/json/json_posts/post_Screen.dart';
import 'package:json_practice/offline/json/json_products/products_dashboard.dart';
import 'package:json_practice/offline/json/json_products/products_provider.dart';
import 'package:json_practice/offline/json/json_users/json_user_provider.dart';
import 'package:json_practice/offline/json/json_users/user_Screen.dart';
import 'package:json_practice/online/airlines/airline_dashboard.dart';
import 'package:json_practice/online/countries_info/countries_HomeScreen.dart';
import 'package:json_practice/online/products_api/products_provider.dart';
import 'package:json_practice/online/products_api/screens/product_view.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'online/airlines/airline_provider.dart';
import 'online/countries_info/countries_provider.dart';
import 'online/post/provider/post_Provider.dart';


import 'online/post/screens/homeScreen.dart';
import 'online/post/screens/post_view.dart';
import 'online/products_api/screens/products_homeScreen.dart';
import 'online/products_from_dummyjson/d_products_dashboard.dart';
import 'online/products_from_dummyjson/d_products_provider.dart';


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
                  ChangeNotifierProvider(create: (context) => P_Provider(),),
                  ChangeNotifierProvider(create: (context) => AirlineProvider(),),
                  ChangeNotifierProvider(create: (context) => CountriesProvider(),),
                  ChangeNotifierProvider(create: (context) => D_ProductsProvider(),),
                  ChangeNotifierProvider(create: (context) => PostProvider(),),
                  ChangeNotifierProvider(create: (context) => ShoppingProvider()),

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
                    "products":(context) => Products_DashBoard(),
                    "airline":(context) => AirLine_DashBoard(),
                    "country":(context) => Countries_HomeScreen(),
                    "post":(context) => PostScreen(),
                    "viewjson":(context) => Post_View(),
                    "d_product":(context) => D_Products_DashBoard(),
                    "shop":(context) => Home_Products(),
                    "productview":(context) => Product_View(),





            },
          ),
        ),
      ),
     // ),
  );
}
