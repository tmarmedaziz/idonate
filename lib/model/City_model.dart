import 'package:firebase_auth/firebase_auth.dart';

class CityModel {
  String? name;
  String? address;


  CityModel({this.name, this.address});

  // receiving data from servor
  factory CityModel.fromMap(map) {
    return CityModel(
      name: map['name'],
      address: map['address'],
    );
  }


}
