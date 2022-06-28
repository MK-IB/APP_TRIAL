import 'package:app_trial/pages/account.dart';
import 'package:app_trial/pages/history.dart';
import 'package:app_trial/pages/home.dart';
import 'package:app_trial/pages/notifications.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_trial/pages/scan.dart';
import 'package:flutter/material.dart';
import 'food_menu/food_menu.dart';
import 'pages/home.dart';
import 'pages/history.dart';
import 'pages/scan.dart';
import 'pages/notifications.dart';
import 'pages/account.dart';
import 'package:app_trial/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  static var commonCollRef;

  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  String fieldVal = "";


  final List<Widget> screens = [
    const Home(),
    const History(),
    const Scan(),
    const Notifications(),
    const Account(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(child: currentScreen, bucket: bucket),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        backgroundColor: kPrimaryColor,
        onPressed: () async {
          ScanResult scanResult = await BarcodeScanner.scan();
          setState(() {
            fieldVal = scanResult.rawContent;
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => FoodMenu(hotelName: fieldVal)));
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //color: kPrimaryColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Home();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 0 ? kPrimaryColor: Colors.grey,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(fontSize: 13,color: currentTab == 0 ? kPrimaryColor : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = History();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list,
                            color: currentTab == 1 ? kPrimaryColor : Colors.grey,
                          ),
                          Text(
                            'Checkpoints',
                            style: TextStyle(fontSize: 13, color: currentTab == 1 ? kPrimaryColor : Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Notifications();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications,
                            color: currentTab == 2 ? kPrimaryColor : Colors.grey,
                          ),
                          Text(
                            'Notification',
                            style: TextStyle(fontSize: 13,color: currentTab == 2 ? kPrimaryColor : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Account();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: currentTab == 3 ? kPrimaryColor : Colors.grey,
                          ),
                          Text(
                            'Account',
                            style: TextStyle(fontSize: 13,color: currentTab == 3 ? kPrimaryColor : Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
