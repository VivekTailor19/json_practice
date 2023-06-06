

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../products_model.dart';
import '../products_provider.dart';

class Shopping_Database extends StatefulWidget {
  const Shopping_Database({Key? key}) : super(key: key);

  @override
  State<Shopping_Database> createState() => _Shopping_DatabaseState();
}

class _Shopping_DatabaseState extends State<Shopping_Database> {


  ShoppingProvider? productT;
  ShoppingProvider? productF;

  @override
  Widget build(BuildContext context) {
    productT = Provider.of<ShoppingProvider>(context);
    productT = Provider.of<ShoppingProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(

            future: productT!.call_api(),
            builder: (context, snapshot) {

              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              else if (snapshot.hasData) {

                List<ShoppingModel> products= snapshot.data!;

                productT!.items = products;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discover",
                              style:
                              TextStyle(fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.5),
                            ),
                            Icon(
                              Icons.notifications_active_outlined,
                              size: 30.sp,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(height: 70.sp,
                            width: 200.sp,
                            decoration: BoxDecoration(borderRadius: BorderRadius
                                .circular(15.w),),
                            alignment: Alignment.center,

                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2.w),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2.w),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  fillColor: Colors.black12,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    size: 25.sp,
                                    color: Colors.black,
                                  ),
                                  hintText: "Search anything",
                                  hintStyle: TextStyle(fontSize: 14.sp,
                                      fontWeight: FontWeight.w300)
                              ),
                            ),
                          ),

                          Container(
                            height: 7.h,
                            width: 7.h,
                            alignment: Alignment.center,
                            child: Icon(Icons.filter_list_rounded, size: 25.sp,
                              color: Colors.white,),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.w),
                                color: Colors.black),
                          )

                        ],
                      ),
                      SizedBox(height: 3.h,),
                      Expanded(
                        child: GridView.builder(
                          itemCount: products.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            mainAxisExtent: 25.h

                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, "productview", arguments: index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 10),
                                child: Container(width: 17.h,
                                  height: 25.h,
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Container(
                                        height: 18.h, width: 18.h,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${products[index]
                                                        .image}"),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.circular(
                                                3.w)
                                        ),

                                      ),
                                      Text("${products[index].title}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp,
                                            overflow: TextOverflow.ellipsis),
                                        textAlign: TextAlign.center,),
                                      Text("\$ ${products[index].price}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                            overflow: TextOverflow.ellipsis),
                                        textAlign: TextAlign.left,),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },),
                      ),

                    ],
                  ),
                );
              }
              else
                return LinearProgressIndicator(
                  color: Colors.black, backgroundColor: Colors.black12,);

            },
          ),),
    );
  }



}


