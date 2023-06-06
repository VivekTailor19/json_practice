import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "JSON",
          style: TextStyle(fontSize: 30, color: Colors.teal),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TapBounceContainer(
              onTap: () {
                Navigator.pushNamed(context, "users");
                showTopSnackBar(
                  displayDuration: Duration(milliseconds: 500 ),
                  animationDuration: Duration(milliseconds: 900),

                  Overlay.of(context),
                  const CustomSnackBar.success(
                    backgroundColor: Colors.indigo,
                    textStyle: TextStyle(color: Colors.white),
                    message:
                        'Welcome Bro,\n You open User Database',
                  ),
                );

              },
              child: HomeOptions("Users"),
            ),
            TapBounceContainer(
              onTap: () {
                Navigator.pushNamed(context, "posts");

                showTopSnackBar(
                  displayDuration: Duration(milliseconds: 500),
                  animationDuration: Duration(milliseconds: 900),
                  Overlay.of(context),
                  const CustomSnackBar.error(
                    message:
                        'Welcome Bro,\n You open Posts Database',
                  ),
                );
              },
              child: HomeOptions("Posts"),
            ),
            TapBounceContainer(
              onTap: () {
                Navigator.pushNamed(context, "people");
                showTopSnackBar(
                  displayDuration: Duration(milliseconds: 500 ),
                  animationDuration: Duration(milliseconds: 900),

                  Overlay.of(context),
                  const CustomSnackBar.success(
                    backgroundColor: Colors.indigo,
                    textStyle: TextStyle(color: Colors.white),
                    message:
                    'Welcome Bro,\n You open People Database',
                  ),
                );
              },
              child: HomeOptions("People"),
            ),
            TapBounceContainer(
              onTap: () {
                Navigator.pushNamed(context, "cart");

                showTopSnackBar(
                  displayDuration: Duration(milliseconds: 500),
                  animationDuration: Duration(milliseconds: 900),
                  Overlay.of(context),
                  const CustomSnackBar.error(
                    message:
                    'Welcome Bro,\n You open Cart Database',
                  ),
                );
              },
              child: HomeOptions("Cart"),
            ),
            TapBounceContainer(
              onTap: () {
                Navigator.pushNamed(context, "products");

                showTopSnackBar(
                  displayDuration: Duration(milliseconds: 500),
                  animationDuration: Duration(milliseconds: 900),
                  Overlay.of(context),
                  const CustomSnackBar.info(
                    message:
                    'Welcome Bro,\n You open Product DashBoard',
                  ),
                );
              },
              child: HomeOptions("Products"),
            ),

            GestureDetector(onTap: () => Navigator.pushNamed(context, "airline"),child: HomeOptions("Airline")),
            GestureDetector(onTap: () => Navigator.pushNamed(context, "country"),child: HomeOptions("Countries")),
            GestureDetector(onTap: () => Navigator.pushNamed(context, "post"),child: Container(width:300,child: Expanded(child: HomeOptions("Post Add Data in Json")))),
            GestureDetector(onTap: () => Navigator.pushNamed(context, "d_product"),child: HomeOptions("D_Products")),
            GestureDetector(onTap: () => Navigator.pushNamed(context, "shop"),child: HomeOptions("Shopping")),


          ],
        ),
      ),
    );
  }


  Widget HomeOptions(String optname) {
    return Container(
      height: 30,
      width: 120,
      alignment: Alignment.center,
      child: Text(
        "$optname",
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.indigo],
          )),
    );
  }

}
