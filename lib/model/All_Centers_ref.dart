import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/Center_model.dart';
import 'package:flutter_application_1/model/City_model.dart';


Future<List<CityModel>> getCities() async{
  var cities = new List<CityModel>.empty(growable: true);
  var CityRef = FirebaseFirestore.instance.collection('AllCities');
  var snapshot = await CityRef.get();
  snapshot.docs.forEach((element) {
    cities.add(CityModel.fromMap(element.data()));

   });
   return cities;
}


Future<List<CenterModel>> getCentersByCity(String cityName) async{
  var centers = new List<CenterModel>.empty(growable: true);
  var centerRef = FirebaseFirestore.instance.collection('AllCities').doc(cityName).collection('Branch');
  var snapshot = await centerRef.get();
  snapshot.docs.forEach((element) {
    centers.add(CenterModel.fromMap(element.data()));

   });
   return centers;
}