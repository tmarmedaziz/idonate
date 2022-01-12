import 'package:firebase_auth/firebase_auth.dart';

class CenterModel {
  String? name;
  String? address;


  CenterModel({this.name, this.address});

  // receiving data from servor
  factory CenterModel.fromMap(map) {
    return CenterModel(
      name: map['name'],
      address: map['address'],
    );
  }


}
