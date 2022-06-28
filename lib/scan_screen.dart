import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){
  return runApp(const ScanScreen());
}
class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String fieldVal = "";
  final _auth = FirebaseAuth.instance;
  late User loggedinUser;
  final _fireStore = FirebaseFirestore.instance;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      loggedinUser = user;
      print('New user logged in as: ' + loggedinUser.email.toString());
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Scanner'),
        ),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(fieldVal),
            /*TextButton(onPressed: (){
              setState(() {
                fieldVal = 'Bobaaal';
              });
            },
                child: Text('PRESS'))*/
          ],
        )),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blueGrey,
          label: Text('Scan'),
          icon: Icon(Icons.camera),
          onPressed: () async{
            ScanResult scanResult = await BarcodeScanner.scan();
            setState(() {
              fieldVal = scanResult.rawContent;
              _fireStore.collection(fieldVal).add({
                'email': loggedinUser.email,
              });
              _fireStore.collection(fieldVal).doc('Menu').set({
                'starter': 'Noodles'
              });
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}