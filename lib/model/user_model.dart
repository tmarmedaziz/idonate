import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? dateBirth;
  String? gender;
  String? bloodType;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.lastName,
      this.dateBirth,
      this.gender,
      this.bloodType});

  // receiving data from servor
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        dateBirth: map['dateBirth'],
        gender: map['gender'],
        bloodType: map['bloodType']);
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'dateBirth': dateBirth,
      'gender': gender,
      'bloodType': bloodType,
    };
  }
}
