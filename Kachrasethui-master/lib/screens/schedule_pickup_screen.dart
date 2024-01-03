// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:ffi';

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

class SchedulePickUpScreen extends StatefulWidget {
  const SchedulePickUpScreen({super.key});

  @override
  State<SchedulePickUpScreen> createState() => _SchedulePickUpScreenState();
}

class _SchedulePickUpScreenState extends State<SchedulePickUpScreen> {
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
          currentIndex: 1,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Schedule a Pick Up",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Schedule a pick up at your time!",
                                style: TextStyle(
                                  fontSize: 12,
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
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 80,
                          width: mq.width,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) => InkWell(
                              onTap: () => setState(() {
                                _selectedDate = index;
                                print("SELECTED IS NOW: " +
                                    _selectedDate.toString());
                              }),
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Text(
                                        intToWeekDay[(DateTime.now().weekday +
                                                        index) %
                                                    7 +
                                                1]!
                                            .substring(0, 3),
                                        style: TextStyle(
                                          color: _selectedDate == index
                                              ? green
                                              : Colors.black,
                                        ),
                                      ),
                                      Text(
                                        (((DateTime.now().day + index)) % 30)
                                            .toString(),
                                        style: TextStyle(
                                          // fontSize: 20,
                                          color: _selectedDate == index
                                              ? green
                                              : Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Row(
                  children: [
                    // check box

                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all(green),
                      value: isRepeatWeekly,
                      onChanged: (value) {
                        setState(() {
                          isRepeatWeekly = value!;
                        });
                      },
                    ),
                    Text(
                      "Repeat Weekly",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all(green),
                      value: isRepeatMonthly,
                      onChanged: (value) {
                        setState(() {
                          isRepeatMonthly = value!;
                        });
                      },
                    ),
                    Text(
                      "Repeat Monthly",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "What would you like to sell?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: mq.width,
                  child: ListView.builder(
                    itemCount: garbageType.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) => InkWell(
                      onTap: () => {
                        setState(() {
                          _selectedWaste = index;
                        })
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Text(
                                garbageType[index],
                                style: TextStyle(
                                  // fontSize: 20,
                                  color: index == _selectedWaste
                                      ? green
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Expected Weight of Selected waste?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  children: [
                    // check box
                    Spacer(),

                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all(green),
                      value: zeroToTen,
                      onChanged: (value) {
                        setState(() {
                          zeroToTen = value!;
                        });
                      },
                    ),
                    Text(
                      "0-10kg",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all(green),
                      value: TentoTwenty,
                      onChanged: (value) {
                        setState(() {
                          TentoTwenty = value!;
                        });
                      },
                    ),
                    Text(
                      "10-20kg",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),

                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all(green),
                      value: moreThanTwenty,
                      onChanged: (value) {
                        setState(() {
                          moreThanTwenty = value!;
                        });
                      },
                    ),
                    Text(
                      "more than 20kg",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "YOUR PICKUP ADDRESS",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      TextButton(onPressed: () {}, child: Text("Edit Address"))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: mq.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: mq.width * 0.7,
                          child: Text(
                            "Link Road Number 3, Near Kali Mata Mandir, Bhopal, 217881",
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Map address = {
                      "address":
                          "Link Road Number 3, Near Kali Mata Mandir, Bhopal, 217881",
                      "pickup_date":
                          DateTime.now().add(Duration(days: _selectedDate)),
                      "category": garbageType[_selectedWaste]
                    };

                    nextScreen(context, PickUpScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        height: 40,
                        width: mq.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5), color: green
                            // border: Border.all(color: green, width: 1)
                            ),
                        child: Center(child: Text("Raise Pickup Request"))),
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
        //floatingActionButton: FloatingActionButton(onPressed: (){},),
      ),
    );
  }
}
