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
          // leading: IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     print("${cpT!.cartlist[0].productlist!.length}");
          //   },
          // ),
        ),
        body: ListView.builder(
          itemCount: cpT!.cartlist.length,
          itemBuilder: (context, index) {
            cpT!.findcartindex(index);
            cpT!.generateRandomColor();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: cpT!.colors[cpT!.z],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Date: ${cpT!.cartlist[index].date}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Id : ${cpT!.cartlist[index].id}"),
                          Text("UserId : ${cpT!.cartlist[index].userId}"),
                        ],
                      ),
                      Text("V_code : ${cpT!.cartlist[index].v}"),
                      SizedBox(width: 5),
                      Text(
                          "Total Product => ${cpT!.cartlist[index].productlist!.length}"),
                      Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                        itemCount: cpT!.cartlist[cpT!.cartindex].productlist!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 4),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Product ID : ${cpT!.cartlist[cpT!.cartindex].productlist![index].productId}",style: TextStyle(fontSize: 15),),
                                Text("Quantity : ${cpT!.cartlist[cpT!.cartindex].productlist![index].quantity}",style: TextStyle(fontSize: 15),),
                              ],
                            ),
                          );
                        },
                      ))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
