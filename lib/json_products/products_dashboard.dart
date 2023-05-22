import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_practice/json_products/products_provider.dart';
import 'package:provider/provider.dart';

class Products_DashBoard extends StatefulWidget {
  const Products_DashBoard({Key? key}) : super(key: key);

  @override
  State<Products_DashBoard> createState() => _Products_DashBoardState();
}

class _Products_DashBoardState extends State<Products_DashBoard> {

  ProductsProvider? productT;
  ProductsProvider? productF;

  @override
  Widget build(BuildContext context) {

    productT = Provider.of<ProductsProvider>(context);
    productF = Provider.of<ProductsProvider>(context,listen: false);

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
              Text("Single : ${productF!.prodctslist.length}"),
              //Text("First : ${productT!.prodctslist[0]!.}"),
            ],
          ),
        ),
      ),
    );
  }
}
