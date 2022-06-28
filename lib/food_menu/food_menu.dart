import 'package:app_trial/food_menu/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_trial/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_trial/home_page.dart';

class FoodMenu extends StatefulWidget {
  String hotelName;
  static var collReference = null;
  FoodMenu({Key? key, required this.hotelName}) : super(key: key);

  @override
  _FoodMenuState createState() => _FoodMenuState(hotelName);
}

class _FoodMenuState extends State<FoodMenu> {
  String hotelName2;
  _FoodMenuState(this.hotelName2);
  var collectionReference = null;


  @override
  initState()
  {
    super.initState();
    collectionReference = FirebaseFirestore.instance.collection(hotelName2 + 'menu');
    FoodMenu.collReference = collectionReference;
    HomePage.commonCollRef = collectionReference;
    //InilializeFirestoreValues();
  }
  /*void InilializeFirestoreValues()
  {
    hotelNameMenu = hotelName2 + 'menu';
  }*/



  @override
  Widget build(BuildContext context) {
    //final Map <String, dynamic> doc = collectionReference.doc('starter').get().data!.data() as Map<String, dynamic>;
  //print("Data present in doc= " + await collectionReference.snapshots().length.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                /*image: DecorationImage(
                    image: AssetImage('assets/food_bg.jpg'),
                    fit: BoxFit.cover)*/
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Menu',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            )),
                    ),
                    MaterialButton(
                      height: 50, minWidth: 50,
                      child: Icon(Icons.shopping_cart_outlined),
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => CartScreen()));
                        }),
                  ],
                ),

                //TODO: PARENT OF THE STACK
                //TODO: STARTER
                Container(
                  width: 400,
                  height: 800,
                    color: Colors.deepPurple,
                    margin: EdgeInsets.only(top: 70),
                  //padding: EdgeInsets.only(left: 10, right: 10),
                  //TODO: THE STACK
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      //TODO: ITEM LIST
                      Positioned(
                        width: 350,
                        top: 40,
                        child: Container(
                          width: 250,
                          padding: EdgeInsets.only(top: 50, bottom: 50),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(1, 0.5),
                                  )
                                ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Starter', style: GoogleFonts.poppins(textStyle: kFoodMenuCategoryStyle)),
                                ShowPanel(itemCategory: 'starter', collectionRef: collectionReference),
                                //showpane(itemName: "Chicken 65", price: i + 200),

                            ],
                          ),
                        ),
                      ),
                      //TODO: FOOD ICON
                      Positioned(
                        top: 0,
                        child: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icons/prawn_starter.jpg'),
                                fit: BoxFit.fill,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ]),
                        ),
                      ),
                      //TODO: ARROW
                      Positioned(
                        bottom: 25,
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          child: Icon(Icons.expand_more_outlined, color: Colors.red,),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(1, 0.5),
                                ),
                              ]),
                        ),
                      ),
                    ]
                  )
                ),
                //TODO: MAIN COURSE
                Container(
                    width: 400,
                    height: 800,
                    color: Colors.red,
                    margin: EdgeInsets.only(top: 70),
                    //padding: EdgeInsets.only(left: 10, right: 10),
                    //TODO: THE STACK
                    child: Stack(
                        alignment: Alignment.center,
                        children: [
                          //TODO: ITEM LIST
                          Positioned(
                            width: 350,
                            top: 40,
                            child: Container(
                              width: 250,
                              padding: EdgeInsets.only(top: 50, bottom: 50),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(1, 0.5),
                                    )
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Main Course', style: GoogleFonts.poppins(textStyle: kFoodMenuCategoryStyle)),
                                  ShowPanel(itemCategory: 'maincourse', collectionRef: FirebaseFirestore.instance.collection(hotelName2 + 'menu')),
                                  //showpane(itemName: "Chicken 65", price: i + 200),

                                ],
                              ),
                            ),
                          ),
                          //TODO: FOOD ICON
                          Positioned(
                            top: 0,
                            child: Container(
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/biriyani.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ]),
                            ),
                          ),
                          //TODO: ARROW
                          Positioned(
                            bottom: 25,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              child: Icon(Icons.expand_more_outlined, color: Colors.red,),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(1, 0.5),
                                    ),
                                  ]),
                            ),
                          ),
                        ]
                    )
                ),
                //TODO: DESERT
                Container(
                    width: 400,
                    height: 800,
                    color: Colors.red,
                    margin: EdgeInsets.only(top: 70),
                    //padding: EdgeInsets.only(left: 10, right: 10),
                    //TODO: THE STACK
                    child: Stack(
                        alignment: Alignment.center,
                        children: [
                          //TODO: ITEM LIST
                          Positioned(
                            width: 350,
                            top: 40,
                            child: Container(
                              width: 250,
                              padding: EdgeInsets.only(top: 50, bottom: 50),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(1, 0.5),
                                    )
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Desert', style: GoogleFonts.poppins(textStyle: kFoodMenuCategoryStyle)),
                                  ShowPanel(itemCategory: 'dessert', collectionRef: FirebaseFirestore.instance.collection(hotelName2 + 'menu')),
                                  //showpane(itemName: "Chicken 65", price: i + 200),

                                ],
                              ),
                            ),
                          ),
                          //TODO: FOOD ICON
                          Positioned(
                            top: 0,
                            child: Container(
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/desert.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ]),
                            ),
                          ),
                          //TODO: ARROW
                          Positioned(
                            bottom: 25,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              child: Icon(Icons.expand_more_outlined, color: Colors.red,),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(1, 0.5),
                                    ),
                                  ]),
                            ),
                          ),
                        ]
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowPanel extends StatelessWidget {

  String itemCategory = '';
  var collectionRef = null;

  ShowPanel({Key? key, required this.itemCategory, required this.collectionRef}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: collectionRef.doc(itemCategory).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            List<ItemName> itemWidget = [];
            int itemCounter = 0;
            data.forEach((k, v) =>
                itemCounter++
              //print('${k} : ${v}')
              //var foodName = k;
            );
            print('Number of items present = $itemCounter');
            for(int i = 1; i <= itemCounter / 2; i++)
              {
                itemWidget.add(ItemName(itemName: data['name$i'], price: double.parse(data['price$i'])));
              }
          return Column(
            children: itemWidget,
          );
        }

        return Text("loading");
      },
    );
  }
}

class ItemName extends StatelessWidget {
  String itemName;
  double price;

  var itemCount = 0;
  bool isAdded = false;
  var currentDocId;
  int qtyCounter = 1;
  var collectionRef = FoodMenu.collReference.doc('table1Cart').collection('table1CartColl');

  ItemName({Key? key, required this.itemName, required this.price }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(itemName, style: GoogleFonts.lato(textStyle: kFoodMenuItemStyle)),
              Text('$price', style: GoogleFonts.lato(textStyle: kFoodMenuItemStyle)),
              Container(
                  padding: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //TODO: + BUTTON
                    MaterialButton(
                      elevation: 0,
                      height: 5,minWidth: 5,
                      child: Icon(Icons.add_outlined),
                      onPressed: () async{
                        if(!isAdded)
                          {
                            /*var docId = UploadFoodData(itemName, price, 1, FoodMenu.collReference);
                            print('ID = $docId');*/
                            DocumentReference docRef = await collectionRef.add({
                              'Item' : itemName,
                              'Price' : price,
                              'Qty': qtyCounter
                            },
                            //  SetOptions(merge : true),
                            );
                            currentDocId = docRef.id;
                            isAdded = true;
                          }else{
                          qtyCounter ++;
                          collectionRef.doc(currentDocId).update(
                            {
                              'Qty' : qtyCounter
                            }
                          );
                        }
                      },
                    ),
                    //TODO: - BUTTON
                    MaterialButton(
                      elevation: 0,
                      height: 5,minWidth: 5,
                      child: Icon(Icons.remove_outlined),
                      onPressed: (){
                        if(qtyCounter > 0)
                          {
                            qtyCounter --;
                            collectionRef.doc(currentDocId).update(
                                {
                                  'Qty' : qtyCounter
                                }
                            );
                            if(qtyCounter == 0)
                              {
                                collectionRef.doc(currentDocId).delete();
                                isAdded = false;
                              }
                          }
                      },
                    ),
                  ]
                )
              ),
            ],
      ),
    );
  }
}
Future<void> UploadFoodData(String itemName, double price, int qty, CollectionReference collRef) async {
  await collRef.doc("table1Cart").collection('table1CartColl').add({
    'Item': itemName,
    'Price': price,
    'Qty': qty,
  });
}