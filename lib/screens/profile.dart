import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/screens/appeal.dart';
import 'package:flutter_application_1/screens/history.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/type.dart';
import 'package:flutter_application_1/screens/vitals.dart';

Widget list({required String text, required Function ontap, color}) {
  return Column(
    children: [
      const SizedBox(height: 15),
      ListTile(
        title: Container(
          padding: EdgeInsets.only(top: 14),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () {
          ontap();
        },
      ),
      const SizedBox(height: 15),
    ],
  );
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  DateTime? _myDateTime;
  String time = 'Pick a date';

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
    //DateTime? _myDateTime;
    //String time = 'Pick a date';

    Widget listview({required String text, required Color color}) {
      return Column(children: [
        SizedBox(
            width: 350,
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  color: color,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.bloodtype, color: Colors.white),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(text,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white)),
                    ],
                  )),
                ),
                const SizedBox(height: 5),
              ],
            ))
      ]);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.red,
        title: Text(
          "${loggedInUser.firstName} ${loggedInUser.lastName}",
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(children: [
          const SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage("Assets/logo.png"),
                  )),
              child: null,
            ),
          ),
          list(
              text: 'Edit Profile',
              ontap: () {
                Navigator.pop(context);
              }),
          list(
              text: 'Change password',
              ontap: () {
                Navigator.pop(context);
              }),
          list(
              text: 'Logout',
              ontap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              }),
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //AA
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, left: 155),
                  child: ClipOval(
                    child: Image.asset(
                      "Assets/image2.jpg",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                color: Colors.red,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.date_range,
                      color: Colors.white,
                    ),
                    SizedBox(width: 30),
                    Text(
                      'Schedule Appointment',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                color: Colors.red,
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => BloodType()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 30),
                    Text(
                      'Blood Type',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 350,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                color: Colors.red,
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => History()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 30),
                    Text(
                      'Donation History',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 350,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                color: Colors.red,
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Vitals()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 30),
                    Text(
                      'View health vitals',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                color: Colors.red,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const Appeal()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.data_saver_off_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 30),
                    Text(
                      'Update an appeal',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
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
