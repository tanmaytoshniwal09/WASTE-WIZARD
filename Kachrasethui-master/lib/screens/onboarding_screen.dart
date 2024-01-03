// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:kachrasethui/Constants/locations.dart';
import 'package:kachrasethui/screens/home_screen.dart';
import 'package:kachrasethui/screens/signInScreen.dart';
import 'package:kachrasethui/widget/next_screen.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // const OnboardingScreen({super.key});
  // PageC.ontroller _controller = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _controller.hasClients ? _controller.page : _controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        // controller: _controller,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: mq.height,
            width: mq.width,
            color: Colors.white,
            child: Column(
              children: [
                // onboarding 3 screen
                SizedBox(
                    height: mq.height * 0.7,
                    width: mq.width,
                    child: Lottie.asset(
                      AppImages.truck,
                    )),
                SizedBox(
                  height: mq.height * 0.03,
                ),
                Text(
                  'Get your waste collected',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                Text(
                  'Our team ,ensures that your waste is picked up within 2 days of your request.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: mq.height,
            width: mq.width,
            color: Colors.white,
            child: Column(
              children: [
                // onboarding 3 screen
                SizedBox(
                    height: mq.height * 0.7,
                    width: mq.width,
                    child: Lottie.asset(
                      AppImages.truck,
                    )),
                SizedBox(
                  height: mq.height * 0.03,
                ),
                Text(
                  'Recycle to earn',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                Text(
                  'Start earning with every recycle and join the effort to create a cleaner and greener world',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: mq.height,
                width: mq.width,
                color: Colors.white,
                child: Column(
                  children: [
                    // onboarding 3 screen
                    SizedBox(
                        height: mq.height * 0.7,
                        width: mq.width,
                        child: Lottie.asset(
                          AppImages.recycle,
                        )),
                    SizedBox(
                      height: mq.height * 0.03,
                    ),
                    Text(
                      'Waste to Compost',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: mq.height * 0.01,
                    ),
                    Text(
                      'Start earning with every recycle and join the effort to create a cleaner and greener world',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                right: 5,
                child: FloatingActionButton(
                  onPressed: () {
                    nextScreen(context, SignInScreen());
                  },
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
