
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/peopleprovider.dart';

class People_DataBase extends StatefulWidget {
  const People_DataBase({Key? key}) : super(key: key);

  @override
  State<People_DataBase> createState() => _People_DataBaseState();
}

class _People_DataBaseState extends State<People_DataBase> {

  @override
  void initState() {
    Provider.of<PeopleProvider>(context,listen: false).fromJson();
    super.initState();
  }

  PeopleProvider? peopleT;
  PeopleProvider? peopleF;

  @override
  Widget build(BuildContext context) {

    peopleT = Provider.of<PeopleProvider>(context);
    peopleF = Provider.of<PeopleProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.teal,
        appBar: AppBar(backgroundColor: Colors.teal,
        title: Text("Peoples",style: TextStyle(color: Colors.white),),),

        body:ListView.builder(
          itemCount: peopleT!.peoples.length,
          scrollDirection: Axis.vertical,

          itemBuilder: (context, index) {

            return Row(
              children: [
                Text("${peopleT!.peoples[index].id}",style: TextStyle(color: Colors.white),),
                SizedBox(width: 25),
                Text("${peopleT!.peoples[index].nameModel!.firstname}"),
                SizedBox(width: 4),
                Text("${peopleT!.peoples[index].nameModel!.lastname}"),
                Spacer(),
                Text(" ${peopleT!.peoples[index].addressModel!.geoLocate!.long}"),
              ],
            );


        },),
      ),
    );
  }
}
