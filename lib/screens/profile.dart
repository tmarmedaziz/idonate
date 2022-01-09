import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/profile.dart';

Widget list({required String text, required Function ontap}) {
  return Column(
    children: [
      SizedBox(
        height: 15,
      ),
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
      SizedBox(
        height: 15,
      )
    ],
  );
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    DateTime? _myDateTime;
    String time = 'Pick a date';

    Widget listview({required String text, required Color color}) {
      return Column(children: [
        Container(
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
                      Icon(
                        Icons.bloodtype,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        text,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ))
      ]);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.red,
        title: Text(
          'UserName',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              print("Container clicked");
            },
            child: Container(
                padding: const EdgeInsets.only(top: 63, right: 20),
                child: const Text(
                  'Schedule',
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(children: [
          Container(
            height: 158,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage("Assets/logo.png"),
                  )),
              child: null,
            ),
          ),
          list(text: 'Edit Profile', ontap: () {}),
          list(
              text: 'View health vitals',
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
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
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Schedule Appointment',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            listview(text: 'Blood Type : O + ', color: Colors.red),
            listview(text: 'History donation', color: Colors.red),
            listview(text: 'Blood Journey', color: Colors.red),
            listview(text: 'History donation', color: Colors.red),
          ],
        ),
      ),
    );
  }
}
