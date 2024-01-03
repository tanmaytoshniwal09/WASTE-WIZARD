import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kachrasethui/Constants/colors.dart';
import 'package:kachrasethui/screens/home_screen.dart';
import 'package:kachrasethui/widget/next_screen.dart';
import 'package:lottie/lottie.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.network(
                'https://assets8.lottiefiles.com/packages/lf20_jbrw3hcz.json'),
            Text(
              'Congratulations!',
              style: TextStyle(color: green, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '+200 points will be added to your wallet after pickup!',
              style: TextStyle(color: Colors.orange, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Your Pickup Request has been placed!'),
            SizedBox(
              height: 10,
            ),
            Text('You have helped nation in it\'s environmental growth!'),
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/chashma.png'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => nextScreenCloseOthers(context, HomeScreen()),
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 25),
                ))
          ],
        ),
      )),
    );
  }
}
