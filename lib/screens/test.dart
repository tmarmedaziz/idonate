// import 'dart:js';



// ignore_for_file: prefer_const_constructors



import 'package:flutter_application_1/model/Center_model.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';





import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/All_Centers_ref.dart';
import 'package:flutter_application_1/model/City_model.dart';
import 'package:flutter_application_1/state/state_management.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({ Key? key }) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  int currentstep = 0;
  int saved = 0;
  String? selectedcity = '';
  String? selectedcenter ;
  int center = 0;
  int? n ;
  DateTime? _myDateTime;
  DateTime now=DateTime.now();
  String? selectedTimeSlot ;
 

  List<Step> getSteps() => [
        Step(state: currentstep > 0 ? StepState.complete:StepState.indexed,isActive: currentstep >=0,title: Text('City'),
         content: Expanded(child: SizedBox(
           height: 350,
           //City
           child: FutureBuilder(
    future: getCities(),
    builder: (context,snapshot){
      if(snapshot.connectionState == ConnectionState.waiting)
        return Center(child: CircularProgressIndicator(),);
      else{
        var cities = snapshot.data as List<CityModel>;
        if(cities == null || cities.length == 0) {
          return Center(child: Text('Cannot load city list'),);
        } else {
          return ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              setState(() {
                saved = index;
                selectedcity = cities[index].name;
              });
            },
            child: Card(
              child: ListTile(
                trailing: saved == index ? const Icon(Icons.check): null  ,
                leading: Icon(Icons.bloodtype_outlined,color: Colors.red,),
                title: Text('${cities[index].name}'),

                ),
        ));
        });
        }
      }
    }),
         )),
         ),
        Step(state: currentstep > 1 ? StepState.complete:StepState.indexed,isActive: currentstep >=1,title: Text('Center'), 
        content: Expanded(child: SizedBox(
           height: 350,
           //Center
           child:FutureBuilder(
    future: getCentersByCity(selectedcity.toString()),
    builder: (context,snapshot){
      if(snapshot.connectionState == ConnectionState.waiting)
        return Center(child: CircularProgressIndicator(),);
      else{
        var centers = snapshot.data as List<CenterModel>;
        if(centers == null || centers.length == 0)
        return Center(child: Text('Cannot load centers list'),);
        else
        return ListView.builder(
          itemCount: centers.length,
          itemBuilder: (context,position){
          return GestureDetector(
            onTap: (){
              setState(() {
                center = position;
                selectedcenter = centers[position].name;
                print(centers[position]);

              });
            },
            child: Card(
              child: ListTile(
                trailing: center == position ? const Icon(Icons.check): null  ,
                leading: Icon(Icons.medical_services_outlined,color: Colors.red,),
                title: Text('${centers[position].name}'),
                subtitle: Text('${centers[position].address}') ,
                ),
        ));
        });
      }
    })
        ))),
        Step(state: currentstep > 2 ? StepState.complete:StepState.indexed,isActive: currentstep >=2,title: Text('Date'), 
        content:Expanded(child: SizedBox(
           height: 400,
           //Date
           child: Column(
      children: [
      Container(
        color: Colors.red,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Center(
              child: Padding(padding: const EdgeInsets.all(12),child: Column(children: [
                Text('${DateFormat.MMMM().format(now)}',style: TextStyle(color: Colors.white),),
                Text('${now.day}',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 22,color: Colors.white),),
                Text('${DateFormat.EEEE().format(now)}',style: TextStyle(color: Colors.white),),
              ],),),
            )
            ),
            GestureDetector(onTap: () async {
                               _myDateTime = await showDatePicker(
                                  context: context ,
                                  helpText: "Pick a date",
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(now.year),
                                  lastDate: now.add(Duration(days: 40)));
                              setState(() {
                                now = _myDateTime!;
                              });
                              print(now.toString());
                            },
            child: Padding(padding: const EdgeInsets.all(8),
              child: Align(alignment: Alignment.centerRight,
                child: Icon(Icons.calendar_today,color: Colors.white,)
            ,),
            )
            )],
        ),
      ),

      Expanded(
        child: GridView.builder(
          itemCount: TIME_SLOT.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3
        ), itemBuilder:(context,index)=> InkWell(
          onTap: (){
            setState(() {
              n = index;
            selectedTimeSlot = TIME_SLOT.elementAt(index);
            // print(n.toString());
            });
          },
          child: Card(
            color: TIME_SLOT.elementAt(index) == selectedTimeSlot ? Colors.white54 : Colors.white,
          child: GridTile(
            child: Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('${TIME_SLOT.elementAt(index)}',style: TextStyle(fontWeight:FontWeight.bold),),
                Text('Available')
              ]
            ),
          ),
          header: TIME_SLOT.elementAt(index) == selectedTimeSlot ? Icon(Icons.check) : null,
          ),
        ),
        )
         ))
    ],
        ))),
          ),
        ];

//         confirmBooking(BuildContext context,DateTime){
//           var timeStamp = DateTime(
//           now.year,
//           now.month,
//           now.day,
//           int.parse(now.toString().split(':')[0].substring(0,2)),
//      int.parse(now.toString().split(':')[0].substring(0,2))
//      ).millisecond;

//      var submitData = {
//        'city' :selectedcity ,
//        'center' : selectedcenter,
//        'user' : 'selected user',
//        'done' : false,
//        'slot' : n,
//        'time': '${selectedTimeSlot}-${DateFormat('dd/MM/yyyy').format(now)}' ,
//        'timestamp':timeStamp };

//       selectedcenter.reference.collection('${DateFormat('dd_MM_yyyy').format(now)}')
// }
  Widget build(BuildContext context) {

    return SafeArea(
      
      child : Scaffold(
        appBar: AppBar(
        toolbarHeight: 70,
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
                padding: const EdgeInsets.only(top: 25, right: 20),
                child: const Text(
                  '',
                  style: TextStyle(fontSize: 15),
                )),
          )
        ],
      ),
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: 
        Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Colors.red)
          ),
        
        child :Stepper(
          physics: BouncingScrollPhysics(),
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentstep,
          onStepTapped: (step) => setState(() => currentstep=step),
          onStepContinue: (){
            final isLastStep = currentstep == getSteps().length -1;
            if(isLastStep){
              currentstep = 3;
            }


            setState(() => currentstep += 1);
          },
          onStepCancel:
           currentstep == 0 ? null:(){
            setState(() => currentstep -= 1);
          } ,
        ),
      )
      
    ));







  }
}







StatefulWidget displayCityList(){
  int saved = 0 ;
  return FutureBuilder(
    future: getCities(),
    builder: (context,snapshot){
      if(snapshot.connectionState == ConnectionState.waiting)
        return Center(child: CircularProgressIndicator(),);
      else{
        var cities = snapshot.data as List<CityModel>;
        if(cities == null || cities.length == 0)
        return Center(child: Text('Cannot load city list'),);
        else
        return ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              // print(selectedCity);
            },
            child: Card(
              child: ListTile(
                trailing: saved == index ? const Icon(Icons.check): null  ,
                leading: Icon(Icons.bloodtype_outlined,color: Colors.red,),
                title: Text('${cities[index].name}'),
                subtitle: Text('${cities[index].address}') ,
                ),
        ));
        });
      }
    });
}


displayCenter(String cityName){
  int saved = 0 ;
  return FutureBuilder(
    future: getCentersByCity(cityName),
    builder: (context,snapshot){
      if(snapshot.connectionState == ConnectionState.waiting)
        return Center(child: CircularProgressIndicator(),);
      else{
        var centers = snapshot.data as List<CenterModel>;
        if(centers == null || centers.length == 0)
        return Center(child: Text('Cannot load centers list'),);
        else
        return ListView.builder(
          itemCount: centers.length,
          itemBuilder: (context,position){
          return GestureDetector(
            onTap: (){
              print(selectedCity);
            },
            child: Card(
              child: ListTile(
                trailing: saved == position ? const Icon(Icons.check): null  ,
                leading: Icon(Icons.medical_services_outlined,color: Colors.red,),
                title: Text('${centers[position].name}'),
                subtitle: Text('${centers[position].address}') ,
                ),
        ));
        });
      }
    });
}

displayTimeSlot(BuildContext context){
  return Column(
    children: [
      Container(
        color: Colors.red,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Center(
              child: Padding(padding: const EdgeInsets.all(12),child: Column(children: [
                Text('${DateFormat.MMMM().format(DateTime.now())}',style: TextStyle(color: Colors.white),),
                Text('${DateTime.now().day}',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 22,color: Colors.white),),
                Text('${DateFormat.EEEE().format(DateTime.now())}',style: TextStyle(color: Colors.white),),
              ],),),
            )
            ),
            GestureDetector(onTap: (){
            
            },
            child: Padding(padding: const EdgeInsets.all(8),
              child: Align(alignment: Alignment.centerRight,
                child: Icon(Icons.calendar_today,color: Colors.white,)
            ,),
            )
            )],
        ),
      )
    ],
  );
}