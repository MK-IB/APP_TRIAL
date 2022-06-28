import 'package:flutter/material.dart';
import 'package:app_trial/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          //TODO: MAIN COLUMN
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.filter_list_outlined),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25.0,
                      backgroundImage: AssetImage('assets/profile_pic.jpg'),
                    ),
                  ]),
              //TODO: Text
              Text("Let's eat",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ))),
              Text("Delicious food",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ))),
              SizedBox(height: 20),
              //TODO: SEARCH BOX
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                  color: Color(0xFFF9F3FF),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: TextField(
                  keyboardType: TextInputType.url,
                  onChanged: (value) {
                    //email = value;
                  },
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      // prefix: Icon(icon),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20),
              //TODO: ROW OF FOOD TYPES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TODO: FIRE ICON
                  Container(
                    padding: EdgeInsets.only(
                        left: 12.0, top: 5.0, right: 12.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0.5),
                          )
                        ]),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10.0,
                          backgroundImage: AssetImage('assets/icons/fire.png'),
                        ),
                        SizedBox(width: 10),
                        Text('All',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ))),
                      ],
                    ),
                  ),
                  //TODO: FOOD ICON
                  Container(
                    padding: EdgeInsets.only(
                        left: 12.0, top: 5.0, right: 12.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0.5),
                          )
                        ]),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10.0,
                          backgroundImage:
                              AssetImage('assets/icons/burger.png'),
                        ),
                        SizedBox(width: 10),
                        Text('Food',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ))),
                      ],
                    ),
                  ),
                  //TODO: DRINK ICON
                  Container(
                    padding: EdgeInsets.only(
                        left: 12.0, top: 5.0, right: 12.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0.5),
                          )
                        ]),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10.0,
                          backgroundImage: AssetImage('assets/icons/glass.png'),
                        ),
                        SizedBox(width: 10),
                        Text('Drink',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              //TODO: RECOMMENDED RESTAURANTS
              Text('Recommend Resaurants',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ))),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0.5),
                          )
                        ]),
                    child: Column(
                      children: [
                        Image.asset('assets/icons/biriyani.png', height: 100),
                        SizedBox(height: 25),
                        Text('Mehfil Kitchen',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ))),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0.5),
                          )
                        ]),
                    child: Column(
                      children: [
                        Image.asset('assets/icons/pizza.jpg', height: 100),
                        SizedBox(height: 25),
                        Text('Shadab Restaurants',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ))),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
