// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kachrasethui/Constants/colors.dart';
import 'package:kachrasethui/Constants/constants.dart';
import 'package:kachrasethui/provider/userprovider.dart';
import 'package:kachrasethui/screens/congrats_screen.dart';
import 'package:kachrasethui/screens/pickup_screen.dart';
import 'package:kachrasethui/widget/bottom_bavigation_bar.dart';
import 'package:kachrasethui/widget/drawer.dart';
import 'package:kachrasethui/widget/next_screen.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CompostScreen extends StatefulWidget {
  const CompostScreen({super.key});

  @override
  State<CompostScreen> createState() => _CompostScreenState();
}

class _CompostScreenState extends State<CompostScreen> {
  bool med = false;
  bool small = false;
  bool large = false;
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserProvider>(context, listen: false);
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Compost & Earn'),
        ),
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Size of compose pit:'),
                ),
                Row(
                  children: [
                    // check box

                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all(green),
                      value: small,
                      onChanged: (value) {
                        setState(() {
                          small = value!;
                        });
                      },
                    ),
                    Text(
                      "Small",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all(green),
                      value: med,
                      onChanged: (value) {
                        setState(() {
                          med = value!;
                        });
                      },
                    ),
                    Text(
                      "Medium",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all(green),
                      value: large,
                      onChanged: (value) {
                        setState(() {
                          large = value!;
                        });
                      },
                    ),
                    Text(
                      "Large",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Date for Visit",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      SfDateRangePicker(
                        // onSelectionChanged: _onSelectionChanged,
                        selectionMode: DateRangePickerSelectionMode.single,
                      ),
                      Text('Add your mobile number:'),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Map address = {
                      "address":
                          "Link Road Number 3, Near Kali Mata Mandir, Bhopal, 217881",
                      // "pickup_date":
                      //     DateTime.now().add(Duration(days: _selectedDate)),
                      // "category": garbageType[_selectedWaste]
                    };

                    nextScreen(context, CongratsScreen());
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
