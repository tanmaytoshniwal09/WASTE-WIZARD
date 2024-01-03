// ignore_for_file: prefer_const_constructors
// import 'package:auto_route/auto_route.dart';
// import 'package:connect_up/Routes/routes.gr.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kachrasethui/Constants/colors.dart';
import 'package:kachrasethui/screens/home_screen.dart';
import 'package:kachrasethui/screens/pickup_screen.dart';
import 'package:kachrasethui/screens/show_pickups_screen.dart';
import 'package:kachrasethui/screens/schedule_pickup_screen.dart';
import 'package:kachrasethui/widget/next_screen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.mediaquery,
  }) : super(key: key);

  final int currentIndex;
  final Size mediaquery;

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('To be added later.'),
      duration: Duration(seconds: 5),
    );
    return Container(
      width: mediaquery.width,
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all()
      ),
      child: FloatingNavbar(
        onTap: (int val) {
          switch (val) {
            case 0:
              currentIndex == 0
                  ? null
                  : nextScreenCloseOthers(context, HomeScreen());
              break;
            case 1:
              // context.pushRoute(ExploreConnectUpScreen());
              currentIndex == 1
                  ? null
                  : nextScreenCloseOthers(context, SchedulePickUpScreen());

              break;
            case 2:
              currentIndex == 2
                  ? null
                  : nextScreenCloseOthers(context, PickupsScreen());
              ;
              break;
            default:
              // context.pushRoute(HomeScreen());
              nextScreenCloseOthers(context, HomeScreen());
          } //returns tab id which is user tapped
        },
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: green,
        selectedBackgroundColor: Colors.transparent,
        currentIndex: currentIndex,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          // FloatingNavbarItem(
          //     icon: Icons.emoji_emotions_outlined, title: 'Explore'),
          FloatingNavbarItem(
              customWidget: SizedBox(
                height: 30,
              ),
              title: 'Schedule Pickup'),
          // FloatingNavbarItem(icon: Icons.person_add, title: 'Edit'),
          FloatingNavbarItem(icon: Icons.shopping_bag, title: 'Pickups'),
        ],
      ),
    );
  }
}

// // ignore_for_file: prefer_const_constructors
// import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';

// class MyBottomNavigationBar extends StatefulWidget {
//     MyBottomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//   }) : super(key: key);

//     int currentIndex;

//   @override
//   State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaquery = MediaQuery.of(context).size;
//     return Container(
//       width: mediaquery.width,
//       color: const Color(0xff7750f8),

//       child: FloatingNavbar(
//         onTap: (int val) {
//           switch (val) {
//             case 0:
//               // context.pushRoute(HomeScreen());

//               break;
//             case 1:
//               // context.pushRoute(IntrestScreen());
//               setState(() {
//                 widget.currentIndex = 1;
//               });
//               break;
//             case 2:
//               // context.pushRoute(ComingSoonScreen());

//               break;
//             case 3:
//               // context.pushRoute(UserProfileScreen());

//               break;
//             case 4:
//               // context.pushRoute(UserProfileScreen());

//               break;
//             default:
//             // context.pushRoute(HomeScreen());
//           } //returns tab id which is user tapped
//         },
//         backgroundColor: const Color(0xff7750f8),
//         unselectedItemColor: Colors.white.withOpacity(0.5),
//         selectedItemColor: Colors.white,
//         selectedBackgroundColor: Colors.transparent,
//         currentIndex: widget.currentIndex,

//         items: [
//           FloatingNavbarItem(icon: Icons.shopping_bag, title: 'Home'),
//           FloatingNavbarItem(
//               icon: Icons.emoji_emotions_outlined, title: 'Explore'),
//           FloatingNavbarItem(icon: Icons.chat_sharp, title: 'Explore'),
//           FloatingNavbarItem(icon: Icons.notifications, title: 'Chats'),
//           FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
//         ],
//       ),
//     );
//   }
// }
