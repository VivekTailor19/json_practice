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
    Provider.of<PeopleProvider>(context, listen: false).fromJson();
    super.initState();
  }

  PeopleProvider? peopleT;
  PeopleProvider? peopleF;

  @override
  Widget build(BuildContext context) {
    peopleT = Provider.of<PeopleProvider>(context);
    peopleF = Provider.of<PeopleProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "Peoples",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: GridView.builder(
          itemCount: peopleT!.peoples.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          padding: EdgeInsets.only(right: 15,top: 10),
          itemBuilder: (context, index) {
            peopleT!.generateimage();
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, "person",arguments: index),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,bottom: 10),
                child: Container(
                  height: 140,width: 140,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Container(height: 110,width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage("${peopleT!.images[peopleT!.imageindex]}"),fit: BoxFit.fill)
                        ),),

                      Text("@ ${peopleT!.peoples[index].username}",style: TextStyle(color: Colors.indigo,fontSize: 20),)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/*

ListView.builder(
          itemCount: peopleT!.peoples.length,
          scrollDirection: Axis.vertical,

          itemBuilder: (context, index) {


            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("${peopleT!.peoples[index].id}",),
                  SizedBox(width: 25),
                  Text("${peopleT!.peoples[index].nameModel!.firstname}"),
                  SizedBox(width: 4),
                  Text("${peopleT!.peoples[index].nameModel!.lastname}"),
                  Spacer(),
                  Text(" ${peopleT!.peoples[index].addressModel!.geoLocate!.long}"),
                ],
              ),
            );


        },),
*/
