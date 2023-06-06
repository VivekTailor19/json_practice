class CountriesModel
{
  num? area,population;
  String? cca2, region, subregion,flag, startOfWeek;
  bool? independent,landlocked;

  NameModel? nameModel;
  FlagsModel? flagsModel;
 // CoatOfArms? coatOfArms;

  MapsModel? mapsModel;
  List<num>? latlng;
  List<String>? capital;
  List<String>? altSpellings;
  List<String>? borders;
  List<String>? timeszones;
  List<String>? continents;

  CountriesModel({this.area, this.population, this.cca2, this.region,
    this.subregion, this.flag, this.startOfWeek, this.independent,
    this.landlocked, this.nameModel, this.mapsModel, this.flagsModel,
    this.latlng, this.capital, this.altSpellings,
    this.borders, this.timeszones, this.continents});


//CurrenciesModel? currenciesModel;
//  IDDModel? iddModel; every country diffrent key name

  factory CountriesModel.fromJson(Map ct)
  {
    return CountriesModel(
      nameModel:NameModel.fromJson( ct['name']),
      flag: ct['flag'],
      flagsModel: FlagsModel.fromJson(ct['flags'])
    );
  }

}

class NameModel
{
  String? common,official;
  NameModel({this.common, this.official});

  factory NameModel.fromJson(Map ct)
  {
    return NameModel(common:ct['common'] ,official:ct['official'] );
  }
}

class FlagsModel
{
  String? png,alt;

  FlagsModel({this.png,this.alt});
  factory FlagsModel.fromJson(Map ct)
  {
    return FlagsModel(png: ct['png'],alt: ct['alt']);
  }
}




class IDDModel
{
  String? root;
  List<String>? suffixes;

  IDDModel({this.root, this.suffixes});

  factory IDDModel.fromJson(Map ct)
  {
    return IDDModel(root: ct['root'],suffixes:ct['suffixes'] );
  }

}

class MapsModel
{
  String? googlemap,openstreet;
  MapsModel({this.googlemap, this.openstreet});

  factory MapsModel.fromJson(Map ct)
  {
    return MapsModel(googlemap: ct['googleMaps'],openstreet:ct['openStreetMaps'] );
  }
}
