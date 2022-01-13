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
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Profile()),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const Appeal()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 30),
                    Text(
                      'Create an appeal for donation',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
