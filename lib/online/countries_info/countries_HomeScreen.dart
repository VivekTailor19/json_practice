import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'countries_model.dart';
import 'countries_provider.dart';

class Countries_HomeScreen extends StatefulWidget {
  const Countries_HomeScreen({Key? key}) : super(key: key);

  @override
  State<Countries_HomeScreen> createState() => _Countries_HomeScreenState();
}

class _Countries_HomeScreenState extends State<Countries_HomeScreen> {

  CountriesProvider? countryT;
  CountriesProvider? countryF;

  @override
  Widget build(BuildContext context) {

    countryT = Provider.of<CountriesProvider>(context);
    countryF = Provider.of<CountriesProvider>(context,listen: false);
    return SafeArea(
      child: FutureBuilder(future: countryT!.load_Datas(),
        builder: (context, snapshot) {

         if(snapshot.hasError)
           {
             return Scaffold(body: Center(child: Text("${snapshot.error}")));
           }
          else if(snapshot.hasData)
          {
            List<CountriesModel> country = snapshot.data!;
            return Scaffold(

              appBar: AppBar(backgroundColor: Colors.teal,title: Text("Countries Flags",style: TextStyle(fontSize: 25),),centerTitle: true,),
                body: GridView.builder(
                  padding: EdgeInsets.only(top: 15,bottom: 10),
                  itemCount: country.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  mainAxisExtent: 140),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(height: 140,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                         color: Colors.teal.shade50
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          
                          children: [
                            Container(height: 100,
                              width: 150,
                              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${country[index].flagsModel!.png}"),fit: BoxFit.fill)),),
                            SizedBox(height: 10,),
                            Text("${country[index].nameModel!.common}",style: TextStyle(fontSize: 14.5.sp),overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      ),
                    );
                  },)

            );
        }
          else return Scaffold(
            body: Center(child: CircularProgressIndicator(color: Colors.teal,backgroundColor: Colors.teal.shade50,)),
          );
        },

      ),
    );
  }
}
