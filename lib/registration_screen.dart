import 'package:app_trial/loginscreen.dart';
import 'package:app_trial/success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'scan_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/login.svg',
                  height: 150,
                ),
                SizedBox(height: 20),
                Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                    style: GoogleFonts.archivo(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        )),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    //border: Border.all(color: Colors.blue),
                  ),
                  child: Column(
                    children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50)
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(1.0, 1.0),
                              )
                            ],
                          //    border: Border(bottom: BorderSide(color: Colors.grey)),
                          ),
                              //borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value){
                              email = value;
                            },
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                                hintText: 'Email or Phone number',
                                hintStyle: TextStyle(color: Colors.grey),
                                icon: Icon(
                                  Icons.account_circle,
                                  color: Color(0xFFAB47BC),
                                ),
                                // prefix: Icon(icon),
                                border: InputBorder.none),
                          ),
                        ),
                      SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(50)
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(1.0, 1.0),
                            )
                          ],),
                        //borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: TextField(
                          obscureText: true,
                          onChanged: (value){
                            password = value;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(
                                Icons.lock,
                                color: Color(0xFFAB47BC),
                              ),
                              // prefix: Icon(icon),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  elevation: 0,
                  color: Color(0xFFAB47BC),
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    elevation: 0,
                    minWidth: double.maxFinite,
                    height: 50,
                    onPressed: () async{
                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if(newUser != null){
                          //DIRECT TO THE SCAN SCREEN
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ScanScreen()));
                        }
                      }catch(e){
                        print(e);
                      }
                    },
                    color: Color(0xFFAB47BC),
                    child: Text('Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: 'Already have account? ',
                  style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16.0,
                  ),
                ),
                TextSpan(
                    text: 'Login',
                    style: const TextStyle(
                      color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      }),
              ]),
            )],
          ),
        ),
      ),
    ));
  }
}
