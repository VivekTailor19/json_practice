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

          ],
        ),
      ),
    );
  }


  Widget HomeOptions(String optname) {
    return Container(
      height: 60,
      width: 200,
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
