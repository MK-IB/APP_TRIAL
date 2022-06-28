import 'package:flutter/material.dart';
import 'package:app_trial/constants.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundBlackColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Checkpoints',
                  style: TextStyle(color: Colors.white,fontSize: 30.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  '30 Results',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                //---- **** CARD **** ----
              ],
            ),
          ),
          SizedBox(height: 10.0),
          // ***** PARENT OF LIST *****
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: kListColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Hotel Chill Palace',
                        style: kMediumTextStyle),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text('5', style: kSmallWhiteTextStyle),
                            Text('Visits', style: kSmallWhiteTextStyle),
                          ]
                        )
                      ],
                    ),
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
