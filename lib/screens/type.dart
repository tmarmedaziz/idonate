import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile.dart';

class BloodType extends StatefulWidget {
  const BloodType({Key? key}) : super(key: key);

  @override
  _BloodTypeState createState() => _BloodTypeState();
}

enum types {
  Onegatif,
  Opositif,
  Anegatif,
  Apositif,
  Bnegatif,
  Bpositif,
  ABnegatif,
  ABpositif
}

class _BloodTypeState extends State<BloodType> {
  List<String> types1 = ['O-', 'O+', 'A-', 'A+', 'B-', 'B+', 'AB-', 'AB+'];
  List<String> tempArray = [];

  types _value = types.Onegatif;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.red,
        title: const Text(
          "Blood type",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Profile()),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Please select your blood type',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20.0),
              const Text(
                "O-         ",
                textAlign: TextAlign.center,
              ),
              Radio(
                activeColor: Colors.red,
                value: types.Onegatif,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as types;
                    print(_value);
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20.0),
              const Text(
                "O+        ",
                textAlign: TextAlign.center,
              ),
              Radio(
                activeColor: Colors.red,
                value: types.Opositif,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as types;
                    print(_value);
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20.0),
              const Text(
                "A-         ",
                textAlign: TextAlign.center,
              ),
              Radio(
                activeColor: Colors.red,
                value: types.Anegatif,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as types;
                    print(_value);
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20.0),
              const Text(
                "A+        ",
                textAlign: TextAlign.center,
              ),
              Radio(
                activeColor: Colors.red,
                value: types.Apositif,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as types;
                    print(_value);
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20.0),
              const Text(
                "B-         ",
                textAlign: TextAlign.center,
              ),
              Radio(
                activeColor: Colors.red,
                value: types.Bnegatif,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as types;
                    print(_value);
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20.0),
              const Text(
                "B+        ",
                textAlign: TextAlign.center,
              ),
              Radio(
                activeColor: Colors.red,
                value: types.Bpositif,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as types;
                    print(_value);
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20.0),
              const Text(
                "AB-      ",
                textAlign: TextAlign.center,
              ),
              Radio(
                activeColor: Colors.red,
                value: types.ABnegatif,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as types;
                    print(_value);
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20.0),
              const Text(
                "AB+     ",
                textAlign: TextAlign.center,
              ),
              Radio(
                activeColor: Colors.red,
                value: types.ABpositif,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as types;
                    print(_value);
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 270,
            height: 40,
            child: Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                color: Colors.red,
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Profile()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 30),
                    Text(
                      'Confirm selection',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
