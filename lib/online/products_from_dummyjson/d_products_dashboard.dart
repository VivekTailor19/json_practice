import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'd_products_provider.dart';

class D_Products_DashBoard extends StatefulWidget {
  const D_Products_DashBoard({Key? key}) : super(key: key);

  @override
  State<D_Products_DashBoard> createState() => _D_Products_DashBoardState();
}

class _D_Products_DashBoardState extends State<D_Products_DashBoard> {
  D_ProductsProvider? productT;
  D_ProductsProvider? productF;

  @override
  void initState() {
    Provider.of<D_ProductsProvider>(context,listen: false).catchjson_n_loadit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    productT = Provider.of<D_ProductsProvider>(context);
    productF = Provider.of<D_ProductsProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Products_DashBoard"),centerTitle: true,),
        body:  Center(
          child: productT!.d_products!=null ?Column(
            children: [
              Text("total : ${productT!.d_products!.total}"),
              Text("total products : ${productT!.d_products!.productlist!.length}"),
              Text("product 1 brand  : ${productT!.d_products!.productlist![0].brand}"),

            ],
          ) :
         Text("data")
      ),),
    );
  }
}
