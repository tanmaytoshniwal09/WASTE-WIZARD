// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kachrasethui/Constants/colors.dart';
import 'package:kachrasethui/Constants/constants.dart';
import 'package:kachrasethui/provider/userprovider.dart';
import 'package:kachrasethui/screens/pickup_screen.dart';
import 'package:kachrasethui/widget/bottom_bavigation_bar.dart';
import 'package:kachrasethui/widget/drawer.dart';
import 'package:kachrasethui/widget/next_screen.dart';
import 'package:provider/provider.dart';

class PickupsScreen extends StatefulWidget {
  const PickupsScreen({super.key});

  @override
  State<PickupsScreen> createState() => _PickupsScreen();
}

class _PickupsScreen extends State<PickupsScreen> {
  int _selectedDate = 0;
  int _selectedWaste = 0;
  bool isRepeatWeekly = false;
  bool isRepeatMonthly = false;
  bool zeroToTen = false;
  bool TentoTwenty = false;
  bool moreThanTwenty = false;
  List<String> garbageType = [
    "Waste",
    "Plastic",
    "Glass",
    "Paper",
    "Metal",
  ];
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserProvider>(context, listen: false);
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: 2,
          mediaquery: mq,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 1,
          // highlightElevation: 5,
          backgroundColor: Colors.white,
          onPressed: () {},
          child: Icon(
            Icons.calendar_month_outlined,
            color: green,
          ),
        ),

        body: SizedBox(
          height: mq.height,
          width: mq.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: mq.height * 0.2,
                      width: mq.width,
                      color: green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello there,",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Checkout your waste pickups!",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Image.asset(
                            "assets/dustbin_schedule_page.png",
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -70,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                            // height: 80,
                            width: mq.width,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text('  Total\nPickups'),
                                        Text(
                                          '2',
                                          style: TextStyle(
                                              color: green, fontSize: 20),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(' Points\nEarned'),
                                        Text(
                                          '5000',
                                          style: TextStyle(
                                              color: green, fontSize: 20),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(' Wallet\nBalance'),
                                        Text(
                                          '2000',
                                          style: TextStyle(
                                              color: green, fontSize: 20),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Upcoming Pickups:",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                PickupCard(mq: mq, txt: "Pending", date: "17 Feb 23"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Previous Pickups:",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 160.0,
                        child: PickupCard(
                            mq: mq, txt: "Completed", date: "12 Feb 23"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        //floatingActionButton: FloatingActionButton(onPressed: (){},),
      ),
    );
  }
}

class PickupCard extends StatelessWidget {
  const PickupCard(
      {super.key, required this.mq, required this.txt, required this.date});

  final Size mq;
  final String txt;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mq.width * 0.5,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(children: [
            Column(
              children: [
                Image.asset('assets/logo.png', height: 50),
                Text(
                  txt,
                  style: TextStyle(
                      color: txt == 'Pending' ? Colors.orange : green),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  overflow: TextOverflow.ellipsis,
                ),
                txt == 'Pending'
                    ? Container()
                    : Text(
                        '+200 \nCoins',
                        style: TextStyle(color: Colors.orange),
                      )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
