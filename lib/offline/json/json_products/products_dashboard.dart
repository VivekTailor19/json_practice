
import 'package:flutter/material.dart';
import 'package:json_practice/offline/json/json_products/products_provider.dart';


import 'package:provider/provider.dart';

import '../../../online/products_api/products_provider.dart';

class Products_DashBoard extends StatefulWidget {
  const Products_DashBoard({Key? key}) : super(key: key);

  @override
  State<Products_DashBoard> createState() => _Products_DashBoardState();
}

class _Products_DashBoardState extends State<Products_DashBoard> {

  P_Provider? productT;
  P_Provider? productF;
  @override
  void initState() {
    super.initState();
    Provider.of<P_Provider>(context,listen: false).useJson();

  }

  @override
  Widget build(BuildContext context) {

    productT = Provider.of<P_Provider>(context);
    productF = Provider.of<P_Provider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Product DashBoard"),
          centerTitle: true,
        ),

        body: Center(
          child: Column(
            children: [

              Text(productT!.p_Model!=null?"Category : ${productT!.p_Model!.items[0].category}":"00"),

            ],
          ),
        ),
      ),
    );
  }
}
