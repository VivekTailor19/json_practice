
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../products_provider.dart';

class Product_View extends StatefulWidget {
  const Product_View({Key? key}) : super(key: key);

  @override
  State<Product_View> createState() => _Product_ViewState();
}

class _Product_ViewState extends State<Product_View> {

  ShoppingProvider? productT;
  ShoppingProvider? productF;

  @override
  Widget build(BuildContext context) {
    productT = Provider.of<ShoppingProvider>(context);
    productT = Provider.of<ShoppingProvider>(context, listen: false);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        iconSize: 28.sp,
                      ),
                      Text(
                        "Details",
                        style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1),
                      ),
                      Icon(
                        Icons.notifications_active_outlined,
                        size: 28.sp,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 35.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.w),
                      image: DecorationImage(
                          image: NetworkImage("${productT!.items[index].image}"), fit: BoxFit.fill),
                      color: Colors.black12),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Text("${productT!.items[index].title}",
                    style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500,letterSpacing: -1,wordSpacing: -1),
                  ),
                ),
                Text("🌀 ${productT!.items[index].category}",style: TextStyle(color: Colors.blue,fontSize: 15.sp),),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    children: [
                      Text(
                        "⭐ ${productT!.items[index].ratingModel!.rate}/5 ",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      Text(
                        "(${productT!.items[index].ratingModel!.count} reviews)",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: Colors.black45),
                      ),

                    ],
                  ),
                ),
                Text(
                  "${productT!.items[index].description}",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black38
                  ),
                  textAlign: TextAlign.justify,
                ),
                
                Padding(
                  padding:  EdgeInsets.only(top: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("\$ ${productT!.items[index].price}",style: TextStyle(fontSize: 25.sp,letterSpacing: -2),),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black,),
                        onPressed: () {},
                        child: Text("Add to Cart",style: TextStyle(fontSize: 15.sp,wordSpacing:3)),)
                    ],
                  ),
                )

                


              ],
            ),
          ),
        ),
      ),
    );
  }
}
