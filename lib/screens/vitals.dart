import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile.dart';

class Vitals extends StatefulWidget {
  const Vitals({Key? key}) : super(key: key);

  @override
  _VitalsState createState() => _VitalsState();
}

class _VitalsState extends State<Vitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.red,
        title: const Text(
          "Health Vitals",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Profile()),
          ),
        ),
      ),
    );
  }
}
