import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartprovider.dart';

class Cart_DataBase extends StatefulWidget {
  const Cart_DataBase({Key? key}) : super(key: key);

  @override
  State<Cart_DataBase> createState() => _Cart_DataBaseState();
}

class _Cart_DataBaseState extends State<Cart_DataBase> {

  CartProvider? cpT;
  CartProvider? cpF;

  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false).fromJson();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    cpT = Provider.of<CartProvider>(context);
    cpF = Provider.of<CartProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Cart DataBase"),
        ),
        body: ListView.builder(
          itemCount: cpT!.cartlist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("${cpT!.cartlist[index].id}"),
                  SizedBox(width: 5),
                  Text("${cpT!.cartlist[index].date}"),
                  Spacer(),
                  Text("${cpT!.cartlist[index].productlist![0].productId}"),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
