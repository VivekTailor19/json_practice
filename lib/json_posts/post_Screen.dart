import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'json_post_provider.dart';

class Posts_Screen extends StatefulWidget {
  const Posts_Screen({Key? key}) : super(key: key);

  @override
  State<Posts_Screen> createState() => _Posts_ScreenState();
}

class _Posts_ScreenState extends State<Posts_Screen> {
  PostJsonProvider? postT;
  PostJsonProvider? postF;

  @override
  void initState() {
    Provider.of<PostJsonProvider>(context, listen: false).getjsondata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    postF = Provider.of<PostJsonProvider>(context, listen: false);
    postT = Provider.of<PostJsonProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.indigo.shade100,
        appBar: AppBar(backgroundColor: Colors.indigo.shade100,
          title: Text("User Datas"),centerTitle: true,
          elevation: 0
        ),
        body: ListView.builder(
          itemCount: postT!.jsonlist.length,
          itemBuilder: (context, index) {
            return PostTab(
              userid: postT!.jsonlist[index]["userId"],
              id: postT!.jsonlist[index]["id"],
              title: postT!.jsonlist[index]["title"],
              body: postT!.jsonlist[index]["body"]
            );
          },
        ),
      ),
    );
  }

  Widget PostTab({int? userid, int? id, String? title, String? body})
  {
    return Container(
      margin: EdgeInsets.all(5),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.indigo.shade700,blurRadius: 3)],
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text("ID: $id"),
                  Text("UserId: $userid"),
              ],),
            ),
            Text("Title: $title",style: TextStyle(fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,fontSize: 15),),
            Text("$body",style: TextStyle(fontSize: 15,overflow: TextOverflow.ellipsis),),
          ],
        ),
      ),

    );

  }

}
