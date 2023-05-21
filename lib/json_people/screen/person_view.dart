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
              Text("${personT!.peoples[index].nameModel!.lastname} ",style:TextStyle(fontSize: 22,),),
              Text("${personT!.peoples[index].nameModel!.firstname}".toUpperCase(),style:TextStyle(fontSize: 23,),),
            ],
          ),
        ),

        body: Column(
          children: [
            Text("data")
            /*
                        "address": {
                        "geolocation": {
                          "lat": "-37.3159",
                          "long": "81.1496"
                        },
                        "city": "kilcoole",
                        "street": "new road",
                        "number": 7682,
                        "zipcode": "12926-3874"
                      },
                      "id": 1,
                      "email": "john@gmail.com",
                      "username": "johnd",
                      "password": "m38rmF$",
                      "name": {
                        "firstname": "john",
                        "lastname": "doe"
                      },
                      "phone": "1-570-236-7033",
                      "__v": 0
            */
          ],
        ),

      ),
    );
  }
}
