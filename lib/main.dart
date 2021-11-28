import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/registration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

//return Scaffold(
//     appBar: AppBar(
//       backgroundColor: Colors.red,
//       title: const Text(
//         'i Donated',
//         style: TextStyle(
//           fontFamily: 'SourceSansPro',
//         ),
//         ),
//       centerTitle: true,
//     ),
//     body:Row(
//       // mainAxisAlignment: MainAxisAlignment.spaceAround,
//       // crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           flex: 4,
//           child: Container(
//             padding: EdgeInsets.all(30),
//             color: Colors.deepOrange,
//             child: const Text('1'),
//           ),
//         ),
//         Expanded(
//           flex: 2,
//           child: Container(
//             padding: EdgeInsets.all(30),
//             color: Colors.blue,
//             child:const Text('2')
//             ),
//         ),
//         Expanded(
//           flex: 2,
//           child: Container(
//             padding: EdgeInsets.all(30),
//             color: Colors.red,
//             child: Text('3'),
//           ),
//         )
//       ],
//       ),

//     floatingActionButton: const FloatingActionButton(
//       child: Text(
//         'Back',
//         style: TextStyle(
//           color: Colors.white,
//           fontFamily: 'SourceSansPro',
//         ),
//         ),
//         backgroundColor: Colors.red,
//       onPressed: null,),
//   );

//Button
// child:ElevatedButton(
//   style: ButtonStyle(
//     backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
//     foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
//   ),
//   // ignore: avoid_print
//   onPressed: () { print('object'); },
//   child: const Text('Hello world'),
// ),

//ROW
//        Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   // ignore: prefer_const_literals_to_create_immutables
//   children: [
//      const Text('hello world!'),
//      Container(
//        color: Colors.cyanAccent,
//        child: const Text('container text'),
//      ),
//      ElevatedButton(
//        onPressed: (){},
//        child:Text('hey')
//        )
//   ],
// ),

//Column
//body:Column(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Container(
//       color: Colors.deepOrange,
//       child: const Text('hey you'),
//     ),
//     ElevatedButton(
//       onPressed: (){},
//       child:const Text('hey youuuuu!')
//       ),
//     const Text('data')
//   ],
//   ),
