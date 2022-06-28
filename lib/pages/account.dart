import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_trial/constants.dart';
class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 320,
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(80.0),bottomRight: Radius.circular(80.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(1, 0.5),
                    )
                  ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Mallik Ebadat',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ))),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 45.0,
                    backgroundImage: AssetImage('assets/ibadat.jpg'),
                  ),
                  ],
          ),
        ),
          SizedBox(height: 30),
          Container(
            width: 320,
            margin: EdgeInsets.only(left: 30),
            padding: EdgeInsets.only(
                left: 20, top: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(1, 0.5),
                  )
                ]),
            child: Column(
              children: [
                Text('Your Points',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ))),
              ],
            ),
          ),
        ],
      )));
  }
}
