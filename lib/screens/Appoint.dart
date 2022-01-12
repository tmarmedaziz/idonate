// import 'package:flutter/material.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:im_stepper/stepper.dart';

// class BookingScreen extends ConsumerWidget{
//   @override
//   int currentstep = 0;
//   Widget build(BuildContext context,WidgetRef ref) {
//     List<Step> getSteps() => [
//         Step(title: Text('City'), content: Container(),),
//         Step(title: Text('Date'), content: Container(),),
//         Step(title: Text('Bla Bla'), content: Container(),)
//       ];
//     return SafeArea(
      
//       child : Scaffold(
//         appBar: AppBar(
//         toolbarHeight: 70,
//         backgroundColor: Colors.red,
//         title: Text(
//           'UserName',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//         ),
//         centerTitle: true,
//         actions: [
//           GestureDetector(
//             onTap: () {
//               print("Container clicked");
//             },
//             child: Container(
//                 padding: const EdgeInsets.only(top: 25, right: 20),
//                 child: const Text(
//                   'Schedule',
//                   style: TextStyle(fontSize: 15),
//                 )),
//           )
//         ],
//       ),
//         resizeToAvoidBottomInset: true,
//         backgroundColor: Colors.red,
//         body: Stepper(
//           type: StepperType.horizontal,
//           steps: getSteps(),
//           currentStep: currentstep,
//           onStepContinue: (){
//           }
//         ),
//       )
      
//     );

    
//       // child: Scaffold(
//       //   appBar: AppBar(
//       //   toolbarHeight: 70,
//       //   backgroundColor: Colors.red,
//       //   title: Text(
//       //     'UserName',
//       //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//       //   ),
//       //   centerTitle: true,
//       //   actions: [
//       //     GestureDetector(
//       //       onTap: () {
//       //         print("Container clicked");
//       //       },
//       //       child: Container(
//       //           padding: const EdgeInsets.only(top: 25, right: 20),
//       //           child: const Text(
//       //             'Schedule',
//       //             style: TextStyle(fontSize: 15),
//       //           )),
//       //     )
//       //   ],
//       // ),
//       //   ));
//   }

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
  
// }