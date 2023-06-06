class PeopleModel {
  int? id, v;
  String? username, password, phone, email;
  AddressModel? addressModel;
  NameModel? nameModel;

  PeopleModel(
      {this.id, this.v, this.username, this.password, this.phone, this.email,
        this.addressModel,this.nameModel });

  factory PeopleModel.fromJson(Map mp)
  {
    return PeopleModel(
        id: mp['id'],
        v: mp['__v'],
        phone: mp['phone'],
        email: mp['email'],
        password: mp['password'],
        username:mp['username'],
        nameModel: NameModel.fromJson(mp['name']),
        addressModel: AddressModel.fromJson(mp['address']));
  }
}

class NameModel {
  String? firstname, lastname;

  NameModel({this.firstname, this.lastname});

  factory NameModel.fromJson(Map mp)
  {
    return NameModel(firstname: mp['firstname'], lastname: mp['lastname']);
  }
}

class AddressModel {
  int? number;
  String? city, street, zipcode;
  GeoLocate? geoLocate;

  AddressModel(
      {this.number, this.city, this.street, this.zipcode, this.geoLocate});

  factory AddressModel.fromJson(Map mp)
  {
    return AddressModel(number: mp['number'],
        city: mp['city'],
        street: mp['street'],
        zipcode: mp['zipcode'],
        geoLocate: GeoLocate.fromJson(mp['geolocation']));
  }

}

class GeoLocate {
  String? lat, long;

  GeoLocate({this.lat, this.long});

  factory GeoLocate.fromJson(Map mp)
  {
    return GeoLocate(lat: mp['lat'], long: mp['long']);
  }
}
