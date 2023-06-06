class AirBaseModel
{
  num? totalPassengers, totalPages;
  List<DataModel>? datalist;

  AirBaseModel({this.totalPassengers, this.totalPages,this.datalist});

  factory AirBaseModel.fromJson(Map air)
  {
    List temp = air['data'];
    List<DataModel> datas = temp.map((e)=>DataModel.fromJson(e)).toList();
    return AirBaseModel(
        totalPages: air['totalPassengers'],
        totalPassengers: air['totalPages'],
        datalist: datas
    );
  }
}

class DataModel
{
  int? trips,v;
  String? did,dname;
  List<AirlineModel>? airlineModel;

  DataModel({this.trips, this.v, this.did, this.dname, this.airlineModel});

  factory DataModel.fromJson(Map air)
  {
    List temp = air['airline'];
    List<AirlineModel> airlist = temp.map((e)=>AirlineModel.fromJson(e)).toList();
    return DataModel(trips:air['trips'], v:air['__v'], did:air['_id'], dname:air['name'],
        airlineModel: airlist);
  }
}

class AirlineModel
{
  int? air_id,air_v;
  String? string_id,name,country,logo,slogan,head_quaters,website,established;

  AirlineModel({this.air_id, this.air_v, this.string_id, this.name, this.country,
      this.logo, this.slogan, this.head_quaters, this.website, this.established});

  factory AirlineModel.fromJson(Map air)
  {

    return AirlineModel(
      air_id:air['id'] ,air_v:air['__v'] ,string_id: air['_id'],
      name:air['name'] ,logo:air['logo'] ,country:air['country'] ,
        established:air['established'] ,head_quaters:air['head_quaters'] ,slogan:air['slogan'] ,website:air['website']
    );
  }
}


