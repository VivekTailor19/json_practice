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
              leading: IconButton(onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back,size: 25,color: Colors.indigo.shade700,)),
          title: Text(
            "Posts Datas", style: TextStyle(color: Colors.indigo.shade700),),
          centerTitle: true,
          elevation: 0
      ),
      body: Scrollbar(
        radius: Radius.circular(5),
        trackVisibility: true,
        thickness: 10,
        interactive: true,
        child: GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: postT!.jsonlist.length,
          itemBuilder: (context, index) {
            postT!.generateRandomColor();
            return PostTab(
                userid: postT!.jsonlist[index]["userId"],
                id: postT!.jsonlist[index]["id"],
                title: postT!.jsonlist[index]["title"],
                body: postT!.jsonlist[index]["body"],

                c: postT!.colors[postT!.z],
            );
          },
        ),
      ),
    ),);
  }

  Widget PostTab({int? userid, int? id, String? title, String? body,Color? c}) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.indigo.shade700, blurRadius: 3)],

      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ID: $id"),
                Text("UserId: $userid"),
              ],),
            SizedBox(height: 2),
            Text("Title: $title", style: TextStyle(fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fontSize: 15),),
            SizedBox(height: 8),
            Text("$body", style: TextStyle(
              fontSize: 14, overflow: TextOverflow.ellipsis,), maxLines: 6),
          ],
        ),
      ),

    );
  }

}
