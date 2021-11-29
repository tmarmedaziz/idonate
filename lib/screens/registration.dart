import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

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

  final _formkey = GlobalKey<FormState>();
  final TextEditingController cincontroller = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController dateofbirthcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime? _myDateTime;
    // ignore: unused_local_variable
    Sex? _character = Sex.male;

    final firstnameField = TextFormField(
      autofocus: false,
      controller: firstnamecontroller,
      keyboardType: TextInputType.emailAddress,
      //validators
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
      //validators
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

    final dateofbirthField = TextFormField(
      autofocus: false,
      controller: dateofbirthcontroller,
      keyboardType: TextInputType.emailAddress,
      //validators
      onSaved: (value) {
        dateofbirthcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Date of birth",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );

    final registrationButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: Colors.red,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
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
                      height: 150,
                      child: Image.asset(
                        'Assets/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    firstnameField,
                    const SizedBox(
                      height: 10,
                    ),
                    lastnameField,
                    const SizedBox(
                      height: 10,
                    ),
                    dateofbirthField,
                    const SizedBox(
                      height: 15,
                    ),
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
                        Text('Male'),
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
                        Text('Female'),
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
          'All Rights are saved © 2021',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      )),
    );
  }
}
