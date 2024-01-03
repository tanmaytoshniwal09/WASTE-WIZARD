// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kachrasethui/Constants/colors.dart';
import 'package:kachrasethui/models/sharedpref.dart';
import 'package:kachrasethui/provider/userprovider.dart';
import 'package:kachrasethui/screens/complain_screen.dart';
import 'package:kachrasethui/screens/compost_screen.dart';
import 'package:kachrasethui/screens/schedule_pickup_screen.dart';
import 'package:kachrasethui/widget/bottom_bavigation_bar.dart';
import 'package:kachrasethui/widget/drawer.dart';
import 'package:kachrasethui/widget/next_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserProvider>(context, listen: false);
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            tooltip: 'Notification',
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 20,
            )),
        title: Row(
          children: [
            Spacer(),
            Icon(
              Icons.location_city,
              color: green,
            ),
            Text(
              "Bhopal, India",
              style: TextStyle(
                fontSize: 15,
                color: green,
              ),
            ),
            Spacer(),
          ],
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 0,
        mediaquery: mq,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        // highlightElevation: 5,
        backgroundColor: Colors.white,
        onPressed: () {
          nextScreenCloseOthers(context, SchedulePickUpScreen());
        },
        child: Icon(
          Icons.calendar_month_outlined,
          color: Colors.grey,
        ),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: mq.height * 0.2,
                    viewportFraction: 0.99,
                    autoPlay: true),
                items: [
                  SizedBox(
                    height: mq.height * 0.2,
                    width: mq.width,
                    child: Image.asset(
                      'assets/cover1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.2,
                    width: mq.width,
                    child: Image.asset(
                      'assets/cover1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.2,
                    width: mq.width,
                    child: Image.asset(
                      'assets/cover1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                  Row(
                    children: [
                      Text(
                        'Welcome to ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Kachraseth',
                        style: TextStyle(
                            fontSize: 20,
                            color: green,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  nextScreen(context, SchedulePickUpScreen());
                },
                child: Container(
                  height: mq.height * 0.2,
                  width: mq.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/home_page_request_truck.png",
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "  Request Pick-up",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: mq.width * 0.3,
                            child: Text(
                              "Request trash pick up and earn money and rewards at your doorstep",
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "More Services",
                // textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                "Our exclusive services for your benefits",
                // textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      nextScreen(context, CompostScreen());
                    },
                    child: Container(
                      // height: mq.height * 0.3,
                      width: mq.width * 0.46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Compost & Earn",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  "assets/fertilizer.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                width: mq.width * 0.25,
                                child: Text(
                                  "Setup the home compost model with our professionals",
                                  overflow: TextOverflow.clip,
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      nextScreen(context, ComplainScreen());
                    },
                    child: Container(
                      // height: mq.height * 0.3,
                      width: mq.width * 0.46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Complain & Earn",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  "assets/trash_can.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                width: mq.width * 0.2,
                                child: Text(
                                  "Take pictures of the garbage issue you see on public places and earn rewards",
                                  // overflow: TextOverflow.clip,
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
