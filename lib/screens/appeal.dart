import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile.dart';

class Appeal extends StatefulWidget {
  const Appeal({Key? key}) : super(key: key);

  @override
  _AppealState createState() => _AppealState();
}

class _AppealState extends State<Appeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.red,
        title: const Text(
          "Appeal for donation",
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
