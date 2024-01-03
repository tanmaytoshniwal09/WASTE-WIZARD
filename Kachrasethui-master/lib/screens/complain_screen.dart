// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:ffi';
import 'dart:io';

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({super.key});

  @override
  State<ComplainScreen> createState() => _ComplainScreen();
}

class _ComplainScreen extends State<ComplainScreen> {
  File? galleryFile;
  imageSelectorGallery() async {
    final XFile? file = await ImagePicker.platform.getImage(
      source: ImageSource.gallery,
      // maxHeight: 50.0,
      // maxWidth: 50.0,
    );
    galleryFile = File(file!.path);
    setState(() {});
  }

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
          'Complain & Earn',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(height: 20),
              Text(
                'Pickup Confirmation',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  imageSelectorGallery();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: 200,
                    width: mq.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Upload Image',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: mq.width * 0.9,
                          child: const Text(
                            'Here, upload the pictures of spoiled waste/garbage in your locality or public places to clean city and earn rewards',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Icon(
                          Icons.upload,
                          color: Colors.black,
                          size: 60,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Choose files here(max upload 50MB)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        galleryFile == null
                            ? Container()
                            : Image.file(galleryFile!),
                      ],
                    ),
                  ),
                ),
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
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
