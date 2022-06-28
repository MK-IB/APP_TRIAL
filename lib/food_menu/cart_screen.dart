import 'package:flutter/material.dart';
import 'package:app_trial/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  var collRef = HomePage.commonCollRef;

  @override
  initState()
  {
    super.initState();
    GetCartItems();
  }
  void GetCartItems()
  {
    /*final items = FirebaseFirestore.instance.collection("hotelAmenu").doc("table1Cart").collection("table1CartCollection").snapshots();
    for(var item in items.)
      {
        print(item.);
      }*/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
       appBar: AppBar(
         title: Text("0109"),
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           StreamBuilder<QuerySnapshot>(
             stream: FirebaseFirestore.instance.collection("hotelAmenu").doc("table1Cart").collection("table1CartCollection").snapshots(),
             builder: (context, snapshot){
               if(snapshot.hasData)
                 {
                   final items = snapshot.data?.docs;
                   //Map<String, dynamic> data2 = snapshot.data!.data() as Map<String, dynamic>;
                   List<Text> itemWidgets = [];
                   if(items != null)
                   for(var item in items)
                     {
                       //final itemName = item.data['item'];
                     }
                 }
               throw '';
             },
           ),
         ],
       ),
     ),
    );
  }
}
