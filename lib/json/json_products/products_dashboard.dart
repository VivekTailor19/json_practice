import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_practice/json/json_products/products_provider.dart';

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
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context,listen: false).json_to_use();

  }

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

              Text(productT!.productsModel!=null?"Category : ${productT!.productsModel!.items[0].category}":"00"),
              //Text("First : ${productT!.prodctslist[0]!.}"),
            ],
          ),
        ),
      ),
    );
  }
}
