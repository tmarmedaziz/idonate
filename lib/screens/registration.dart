//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

enum Sex { male, female }

class _RegistrationScreenState extends State<RegistrationScreen> {
  String time = 'Pick a date';
  Sex _value = Sex.male;

  DateTime dateTime = DateTime.now();

  get email => null;

  final _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();

  final TextEditingController cincontroller = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController dateofbirthcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime? _myDateTime;
    // ignore: unused_local_variable
    Sex? _character = Sex.male;

    final firstnameField = TextFormField(
      autofocus: false,
      controller: firstnamecontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter a Valid name(Min 3 characters)");
        }
        return null;
      },
      onSaved: (value) {
        firstnamecontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );

    final lastnameField = TextFormField(
      autofocus: false,
      controller: lastnamecontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Last name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter a Valid name(Min 3 characters)");
        }
        return null;
      },
      onSaved: (value) {
        lastnamecontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a Valid Email");
        }
        return null;
      },
      onSaved: (value) {
        firstnamecontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordcontroller,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for sign in");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter a Valid Password(Min 6 characters)");
        }
      },
      onSaved: (value) {
        firstnamecontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmpasswordcontroller,
      obscureText: true,
      validator: (value) {
        if (confirmpasswordcontroller.text != passwordcontroller.text) {
          return "Password dont match";
        }
        return null;
      },
      onSaved: (value) {
        confirmpasswordcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //final dateofbirthField = TextFormField(
    //  autofocus: false,
    //  controller: dateofbirthcontroller,
    //  keyboardType: TextInputType.emailAddress,
    //validators
    //  onSaved: (value) {
    //    dateofbirthcontroller.text = value!;
    //  },
    //  textInputAction: TextInputAction.next,
    //  decoration: InputDecoration(
    //      prefixIcon: const Icon(Icons.mail),
    //      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    //      hintText: "Date of birth",
    //      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    //);

    final registrationButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: Colors.red,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailcontroller.text, passwordcontroller.text);
        },
        child: const Text(
          "Sign up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceSansPro',
                letterSpacing: 1)),
        backgroundColor: Colors.red,
      ),
      //backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white10,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      child: Image.asset(
                        'Assets/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 20),
                    firstnameField,
                    const SizedBox(height: 20),
                    lastnameField,
                    const SizedBox(height: 20),
                    emailField,
                    const SizedBox(height: 20),
                    passwordField,
                    const SizedBox(height: 20),
                    confirmPasswordField,
                    const SizedBox(height: 20),

                    Row(
                      children: <Widget>[
                        const Text(
                          'Date of birth               ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () async {
                              _myDateTime = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2010),
                                  lastDate: DateTime(2022));
                              setState(() {
                                // ignore: unused_local_variable
                                final now = DateTime.now();
                                time = _myDateTime.toString().split(' ')[0];
                              });
                            },
                            child: Text(time)),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        const Text('Sex :',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SourceSansPro')),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text('Male'),
                        Radio(
                          activeColor: Colors.red,
                          value: Sex.male,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as Sex;
                              print(_value);
                            });
                          },
                        ),
                        const Text('Female'),
                        Radio(
                          activeColor: Colors.red,
                          value: Sex.female,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as Sex;
                              print(_value);
                            });
                          },
                        ),
                        //   const SizedBox(width: 25,),
                        //   Text('Female'),
                        // Radio(
                        //     value: Sex.female,
                        //     groupValue: _character,
                        //     onChanged: (Sex? value) {
                        //       setState(() {
                        //         _character = value;
                        //       });
                        //     },
                        //   ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                      child: registrationButton,
                    ),
                    //  buildDatePicker(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
          child: Container(
        color: Colors.red,
        child: Text(
          "All Rights are saved © 2021",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      )),
    );
  }

  void signUp(String emil, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstnamecontroller.text;
    userModel.lastName = lastnamecontroller.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Profile()), (route) => false);
  }
}
