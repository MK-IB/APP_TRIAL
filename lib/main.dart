import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'loginscreen.dart';
import 'registration_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_page.dart';
import 'food_menu/food_menu.dart';

//void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _HomeScreenState extends State<HomeScreen> {
  Color primaryColor = Color(0xff00B7EB);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40.0),
        /*decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [Colors.lightBlueAccent, Colors.white])),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //We take the image from the assets
            //SizedBox(height: 200,),
            /*Image.asset(
              'assets/clock.png',
              height: 250,
            ),*/
            SvgPicture.asset(
              'assets/chat.svg',
              height: 300,
            ),
            SizedBox(height: 20,),
            Text(
              'Hey! Welcome',
              textAlign: TextAlign.center,
              style: GoogleFonts.archivo(
                  textStyle: TextStyle(color: Colors.black, fontSize: 26,
                    fontWeight: FontWeight.w700,)),
            ),
            SizedBox(height: 10),
            Text('We deliver world class service which I do not know exactly',
              textAlign: TextAlign.center,
              style: GoogleFonts.archivo(
                  textStyle: TextStyle(color: Colors.black26, fontSize: 16,)),),
            SizedBox(height: 20),
            SizedBox(height: 30,),
            Material(
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50.0) ),
              elevation: 0,
              color: Color(0xff00B7EB),
              clipBehavior: Clip.antiAlias,
              child: MaterialButton(
                height: 50,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegistrationScreen()));
                },
                color: kPrimaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Get Started',
                  style: GoogleFonts.archivo(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20,))),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: 30,),
            MaterialButton(
              elevation: 0,
              height: 50,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('I already have an account',
                      style: GoogleFonts.archivo(
                          textStyle: TextStyle(color: Colors.black54, fontSize: 20,))),
                ],
              ),
              textColor: Colors.white,
            ),

            //---+++ HOME PAGE ROUTE +++----//
            MaterialButton(
              elevation: 0,
              height: 50,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => HomePage()));
              },
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HOME PAGE',
                      style: GoogleFonts.archivo(
                          textStyle: TextStyle(color: Colors.black54, fontSize: 20,))),
                ],
              ),
              textColor: Colors.white,
            ),
            MaterialButton(
              elevation: 0,
              height: 50,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => FoodMenu(hotelName: 'From MainMenu',)));
              },
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('FOOD MENU',
                      style: GoogleFonts.archivo(
                          textStyle: TextStyle(color: Colors.black54, fontSize: 20,))),
                ],
              ),
              textColor: Colors.white,
            )

          ],
        ),
      ),
    );
  }
}

