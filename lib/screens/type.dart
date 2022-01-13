import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile.dart';

class BloodType extends StatefulWidget {
  final String? bloodtype;
  const BloodType({Key? key, required this.bloodtype}) : super(key: key);

  @override
  _BloodTypeState createState() => _BloodTypeState();
}

class _BloodTypeState extends State<BloodType> {
  late String _value = widget.bloodtype ?? 'Onegatif';
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
                value: 'Onegatif',
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as String;
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
                value: 'Opositif',
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as String;
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
                value: 'Anegatif',
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as String;
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
                value: 'Apositif',
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as String;
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
                value: 'Bnegatif',
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as String;
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
                value: 'Bpositif',
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as String;
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
                value: 'ABnegatif',
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as String;
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
                value: 'ABpositif',
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as String;
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
                color: Colors.redAccent,
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({"bloodType": _value.toString()});

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
