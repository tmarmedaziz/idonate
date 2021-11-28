import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formkey = GlobalKey<FormState>();
  // editing controller
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      //validators
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );

    // password field
    final passwordField = TextFormField(
      autofocus: false,
      // obscureText: true,
      controller: passwordcontroller,
      //validators
      onSaved: (value) {
        passwordcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
    //login button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: Colors.red,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: const Text(
          "login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    //sign in button
    final signin = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: Colors.red,
      child: MaterialButton(
        // padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegistrationScreen()));
        },
        child: const Text(
          "Sign up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('back3bg.png'),fit: BoxFit.fitHeight
        //   )
        // ),
        child: Scaffold(
      //backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white10,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: Image.asset(
                        'Assets/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      child: Text(
                        "Every drop of BLOOD is like a BREATH for someone",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      child: Text(
                        "Your solution for a comfortable DONATION",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      child: Text(
                        "Book an appointment now for FREE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    emailField,
                    const SizedBox(
                      height: 10,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                      child: loginButton,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        '----------------------------------------------------'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      //signin button
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account ?      ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SourceSansPro')),
                        signin
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

//Login with circle
// Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children : <Widget>[
//                         const Text(
//                           "Login",
//                           style: TextStyle(
//                             fontSize: 40,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'SourceSansPro'
//                             )
//                         ),
//                         const SizedBox(width: 200,),
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundColor: Colors.red,
//                           child: IconButton(
//                             color: Colors.white,
//                             onPressed: (){},
//                             icon: const Icon(Icons.arrow_forward),
//                           ),
//                         )
//                       ],

//                     ),
