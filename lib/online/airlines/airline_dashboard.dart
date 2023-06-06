import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'airline_model.dart';
import 'airline_provider.dart';

class AirLine_DashBoard extends StatefulWidget {
  const AirLine_DashBoard({Key? key}) : super(key: key);

  @override
  State<AirLine_DashBoard> createState() => _AirLine_DashBoardState();
}

class _AirLine_DashBoardState extends State<AirLine_DashBoard> {
  AirlineProvider? airlineT;
  AirlineProvider? airlineF;


  @override
  Widget build(BuildContext context) {
    airlineT = Provider.of<AirlineProvider>(context);
    airlineF = Provider.of<AirlineProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Airlines",style: TextStyle(fontSize: 25),),centerTitle: true,),
        body: FutureBuilder(
          future: airlineT!.futuredatas(),
          builder: (context, snapshot) {

            AirBaseModel? airBaseModel =  snapshot.data!;

            if(snapshot.hasError)
              {
                return Text(("${snapshot.error}"));
              }
            else if(snapshot.hasData)
              {
                return Column(
                  children: [
                    Text("total pages: ${airBaseModel.totalPages}"),
                    Text("dname: ${airBaseModel.datalist![0].dname}"),
                    Text("airmodel.name : ${airBaseModel.datalist![0].airlineModel![0].name}"),
                  ],
                );
              }
            else
              return LinearProgressIndicator(backgroundColor: Colors.lightBlueAccent.shade100,color: Colors.blue.shade800,);
          },
        )
      ),
    );
  }
}
