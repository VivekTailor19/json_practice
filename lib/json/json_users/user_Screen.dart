import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'json_user_provider.dart';

class Users_Screen extends StatefulWidget {
  const Users_Screen({Key? key}) : super(key: key);

  @override
  State<Users_Screen> createState() => _Users_ScreenState();
}

class _Users_ScreenState extends State<Users_Screen> {

  UserJsonProvider? userT;
  UserJsonProvider? userF;

  @override
  void initState() {
    Provider.of<UserJsonProvider>(context,listen: false).getuserjson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userT = Provider.of<UserJsonProvider>(context);
    userF = Provider.of<UserJsonProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.teal,elevation: 15,
          title: Text("Users",style: TextStyle(fontSize: 25,color: Colors.white),),centerTitle: true,),
          body: ListView.builder(
            itemCount: userF!.userlist.length,
            itemBuilder: (context, index) {
              return ExpansionTile(

                childrenPadding: EdgeInsets.only(top: 5),
                leading: Text("${userT!.userlist[index]["id"]}"),
                title: Text("${userT!.userlist[index]["name"]}"),
                subtitle: Text("@ ${userT!.userlist[index]["username"]}"),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("  Personal Info :: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      InfoTabs(title: " • User Id",data: "${userT!.userlist[index]["id"]}"),
                      InfoTabs(title: " • Name",data: "${userT!.userlist[index]["name"]}"),
                      InfoTabs(title: " • Username",data: "${userT!.userlist[index]["username"]}"),
                      InfoTabs(title: " • Email Id",data: "${userT!.userlist[index]["email"]}"),
                      InfoTabs(title: " • Phone No",data: "${userT!.userlist[index]["phone"]}"),
                      InfoTabs(title: " • Website",data: "${userT!.userlist[index]["website"]}"),
                      Text("  Address :: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      InfoTabs(title: " • Street",data: "${userT!.userlist[index]["address"]["street"]},${userT!.userlist[index]["address"]["suite"]}"),
                      InfoTabs(title: " • City",data: "${userT!.userlist[index]["address"]["city"]} - ${userT!.userlist[index]["address"]["zipcode"]}"),
                      InfoTabs(title: "Location - lat / lng",data: "${userT!.userlist[index]["address"]["geo"]["lat"]} / ${userT!.userlist[index]["address"]["geo"]["lng"]}"),

                      Text("  Company :: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),

                      InfoTabs(title: " • Name",data: "${userT!.userlist[index]["company"]["name"]}"),
                      InfoTabs(title: " • Goal",data: "${userT!.userlist[index]["company"]["catchPhrase"]}"),
                      InfoTabs(title: " • Working For",data: "${userT!.userlist[index]["company"]["bs"]}"),
                    ],
                  )

                ],
              );
        },
      )),
    );
  }

  Row InfoTabs({String? title, String? data}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("    $title :-"),
            Text("$data")
        ],);
  }

  //id: userT!.userlist[index]["id"],
  //name: userT!.userlist[index]["name"],
  //phone: userT!.userlist[index]["phone"],


}
