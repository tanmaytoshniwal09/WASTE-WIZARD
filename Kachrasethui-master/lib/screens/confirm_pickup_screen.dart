// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:kachrasethui/Constants/colors.dart';
import 'package:kachrasethui/screens/congrats_screen.dart';
import 'package:kachrasethui/widget/next_screen.dart';

class ConfirmPickUpScreen extends StatefulWidget {
  const ConfirmPickUpScreen({super.key});

  @override
  State<ConfirmPickUpScreen> createState() => _ConfirmPickUpScreenState();
}

class _ConfirmPickUpScreenState extends State<ConfirmPickUpScreen> {
  List<StepperData> stepperData = [
    StepperData(
        title: StepperText(
          "Upload Image",
          textStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
        // subtitle: StepperText("Your order has been placed"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_one, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Pickup Request"),
        // subtitle: StepperText("Your order is being prepared"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_two, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Earn Rewards"),
        // subtitle: StepperText(
        //     "Our delivery executive is on the way to deliver your item"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_3, color: Colors.white),
        )),
  ];
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: green,
        title: const Text(
          'Pickup Request',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // upload image container
            SizedBox(height: 20),
            AnotherStepper(
              stepperList: stepperData,
              stepperDirection: Axis.horizontal,
              iconWidth:
                  40, // Height that will be applied to all the stepper icons
              iconHeight:
                  40, // Width that will be applied to all the stepper icons
            ),
            // Container(
            //   color: Colors.white,
            //   // width: mq.width,
            //   // height: 100,
            //   child: Stepper(type: StepperType.vertical, currentStep: 1, steps: [
            //     Step(
            //       title: Text(
            //         'Upload image',
            //         style: TextStyle(
            //           fontSize: 10,
            //           color: Colors.black,
            //         ),
            //       ),
            //       content: Text('Hello!'),
            //       isActive: true,
            //     ),
            //     Step(
            //       title: Text(
            //         'Pickup Request',
            //         style: TextStyle(
            //           fontSize: 10,
            //           color: Colors.black,
            //         ),
            //       ),
            //       content: Text(
            //         'World!',
            //       ),
            //       // isActive: true,
            //     ),
            //     Step(
            //       title: Text(
            //         'Earn Rewards',
            //         style: TextStyle(
            //           fontSize: 10,
            //           color: Colors.black,
            //         ),
            //       ),
            //       content: Text('Hello World!'),
            //       // state: StepState.complete,
            //       // isActive: true,
            //     ),
            //   ]),
            // ),
            SizedBox(height: 20),
            Text(
              'Pickup Confirmation',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
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
// pickup date and time container
            InkWell(
              onTap: () {
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
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
