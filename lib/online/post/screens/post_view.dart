import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../offline/json/json_cart/cartmodel.dart';
import '../model/productmodel.dart';
import '../provider/post_Provider.dart';

class Post_View extends StatefulWidget {
  const Post_View({Key? key}) : super(key: key);

  @override
  State<Post_View> createState() => _Post_ViewState();
}

class _Post_ViewState extends State<Post_View> {

  PostProvider? postT;
  PostProvider? postF;

  @override
  Widget build(BuildContext context) {

    postT = Provider.of<PostProvider>(context);
    postF = Provider.of<PostProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Json DataBase",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 20.sp)),centerTitle: true,backgroundColor: Colors.teal,),
        body: FutureBuilder(
          future: postF!.datashow(),
          builder: (context, snapshot) {
            if(snapshot.hasError)
            {
              return Center(child: Text("${snapshot.error}"),);
            }
            else if(snapshot.hasData)
              {
                List<ProModel> product = snapshot.data!.reversed.toList();

                return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemCount: product.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("${product[index].productName}",style: TextStyle(fontSize: 15.sp),),
                              Text("₹ ${product[index].productPrice}",style: TextStyle(fontSize: 12.sp),),

                            ],
                          ),
                        );
                      },);

              }


            return Center(child: CircularProgressIndicator());
          },


        ),
      ),
    );
  }
}
