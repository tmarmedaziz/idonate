import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile.dart';

class BloodType extends StatefulWidget {
  const BloodType({Key? key}) : super(key: key);

  @override
  _BloodTypeState createState() => _BloodTypeState();
}

class _BloodTypeState extends State<BloodType> {
  List<String> types = ['O-', 'O+', 'A-', 'A+', 'B-', 'B+', 'AB-', 'AB+'];
  List<String> tempArray = [];

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
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Profile()),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: 50),
            const Text(
              'Please select your blood type',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: types.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (tempArray.contains(types[index].toString())) {
                          tempArray.remove(types[index].toString());
                        } else {
                          tempArray.add(types[index].toString());
                        }
                      });
                      print("myvalue");
                      print(tempArray.toString());
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(types[index].toString()),
                        trailing: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: tempArray.contains(types[index].toString())
                                ? Colors.red
                                : Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                                tempArray.contains(types[index].toString())
                                    ? 'Remove'
                                    : "Select"),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
