import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/post_Provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  TextEditingController txtname = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtoffer = TextEditingController();
  TextEditingController txtcategory = TextEditingController();
  TextEditingController txtrate = TextEditingController();
  TextEditingController txtdesc = TextEditingController();

  PostProvider? postT;
  PostProvider? postF;

  @override
  Widget build(BuildContext context) {

    postT = Provider.of<PostProvider>(context);
    postF = Provider.of<PostProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(" Add To Cart "),centerTitle: true,backgroundColor: Colors.teal,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextTile(txtname, "Name"),
              TextTile(txtprice, "Price"),
              TextTile(txtoffer, "Offer"),
              TextTile(txtcategory, "Category"),
              TextTile(txtrate, "Rate"),
              TextTile(txtdesc, "Description"),

              ElevatedButton(onPressed: () async {
                String msg = await postF!.post_data(txtname.text, txtprice.text, txtoffer.text, txtcategory.text, txtrate.text, txtdesc.text);



                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),
                    content: Text("$msg",style: TextStyle(fontSize: 20.sp,color: Colors.teal.shade800,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  backgroundColor: Colors.white,
                ));
                txtname.clear();
                txtprice.clear();
                txtcategory.clear();
                txtoffer.clear();
                txtdesc.clear();
                txtrate.clear();
                 },
                  child: Text("Add to Cart"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  ),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, "viewjson");
              },
                child: Text("Show"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              )
            ],
          ),
        ),

      ),
    );
  }

  Widget TextTile(TextEditingController txttile,String title)
  {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: TextField(
        controller: txttile,

        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,

          label: Text("$title",style: TextStyle(fontSize: 14.sp),)
        ),
        style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.black54),
      ),
    );
  }

}
