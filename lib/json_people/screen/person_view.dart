import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/peopleprovider.dart';

class Person_View extends StatefulWidget {
  const Person_View({Key? key}) : super(key: key);
  @override
  State<Person_View> createState() => _Person_ViewState();
}

class _Person_ViewState extends State<Person_View> {

  PeopleProvider? personT;
  PeopleProvider? personF;

  @override
  Widget build(BuildContext context) {

    personT = Provider.of<PeopleProvider>(context);
    personF = Provider.of<PeopleProvider>(context,listen:false);

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Row(mainAxisSize: MainAxisSize.min,
            children: [
              Text("${personT!.peoples[index].nameModel!.lastname}  ".toUpperCase(),style:TextStyle(fontSize: 22,),),
              Text("${personT!.peoples[index].nameModel!.firstname}".toUpperCase(),style:TextStyle(fontSize: 23,),),
            ],
          ),
        ),

        body: Column(
          children: [
            Text(":: ${personT!.peoples[index].nameModel!.firstname} ::",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600),),
            Details(title: "User ID",data: "${personT!.peoples[index].id}"),
            Details(title: "V Code",data: "${personT!.peoples[index].v}"),

            Divider(color: Colors.black26,height: 15,thickness: 1,),

            Text(":: Personal Information ::",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600),),
            Details(title: "User Name",data: "${personT!.peoples[index].username}"),
            Details(title: "Phone No",data: "${personT!.peoples[index].phone}"),
            Details(title: "Email Id",data: "${personT!.peoples[index].email}"),
            Details(title: "Password",data: "${personT!.peoples[index].password}"),

            Divider(color: Colors.black26,height: 15,thickness: 1,),
            Text(":: Address ::",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600),),

            Details(title: "Street",data: "${personT!.peoples[index].addressModel!.number} / ${personT!.peoples[index].addressModel!.street}"),
            Details(title: "City",data: "${personT!.peoples[index].addressModel!.city}"),
            Details(title: "Pin-Code",data: "${personT!.peoples[index].addressModel!.zipcode}"),
            Details(title: "Geographical Location",data: "${personT!.peoples[index].addressModel!.geoLocate!.lat} , ${personT!.peoples[index].addressModel!.geoLocate!.long}"),




          ],
        ),

      ),
    );
  }
  Widget Details({String? title, String? data})
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title :",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
          Text("$data",style: TextStyle(fontSize: 14),)
        ],
      ),
    );
  }
}
