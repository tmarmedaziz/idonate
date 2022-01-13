import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/screens/profile.dart';

class Vitals extends StatefulWidget {
  const Vitals({Key? key}) : super(key: key);

  @override
  _VitalsState createState() => _VitalsState();
}

class _VitalsState extends State<Vitals> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.red,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: "${loggedInUser.firstName} ${loggedInUser.lastName}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const TextSpan(
              text: "\n",
            ),
            const TextSpan(
              text: "\n",
            ),
            const TextSpan(
              text: "Health Vitals",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ]),
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
            const SizedBox(height: 50),
            SizedBox(
              width: 350,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.redAccent,
                onPressed: () {
                  null;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 30),
                    Text(
                      'Body Temperature',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 350,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.redAccent,
                onPressed: () {
                  null;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 30),
                    Text(
                      'Pulse Rate',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 350,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.redAccent,
                onPressed: () {
                  null;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 30),
                    Text(
                      'Respiration Rate',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 350,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.redAccent,
                onPressed: () {
                  null;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 30),
                    Text(
                      'Blood Presure',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 350,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.redAccent,
                onPressed: () {
                  null;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 30),
                    Text(
                      'Complete Analysis Report',
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
