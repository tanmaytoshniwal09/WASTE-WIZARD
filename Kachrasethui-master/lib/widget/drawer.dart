import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachrasethui/Constants/colors.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawer2State createState() => _MyDrawer2State();
}

class _MyDrawer2State extends State<MyDrawer> {
  // bool _isupdate = true;
  String userName = "ankurg132";

  Uint8List? image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: green,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 45),
                    image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.memory(image!),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.black,
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        userName,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () async {
                  //await Share.share("https://rishteyy.in/android",
                  // subject: "Thanks for sharing Rishteyy.");
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.people,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Refer a Friend',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(
                      Icons.loop,
                      color: Colors.black,
                    ),
                    title: const Text(
                      'Updates',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.arrow_circle_down_outlined,
                      // size: 20,

                      color: Colors.black,
                    )),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Earn coins',
                    // color: Colors.black,
                    style: TextStyle(
                      fontSize: 20,
                      // color: Colors.white,

                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(
                    Icons.phone,
                  ),
                  title: Text(
                    'Help & Support',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
