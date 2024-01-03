// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:kachrasethui/provider/userprovider.dart';

import 'package:kachrasethui/screens/confirm_pickup_screen.dart';
import 'package:kachrasethui/screens/home_screen.dart';
import 'package:kachrasethui/screens/onboarding_screen.dart';

import 'package:kachrasethui/screens/pickup_screen.dart';
import 'package:kachrasethui/screens/signInScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  final String data = prefs.getString('token') ?? '';
  print("TOKEN FOUDN: " + data);
  runApp(MyApp(data: data));
  // User? user = await FirebaseAuth.instance.currentUser;
}

class MyApp extends StatelessWidget {
  const MyApp({key, this.data}) : super(key: key);
  final String? data;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'Kachara Seth',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: data != '' ? HomeScreen() : OnboardingScreen()),
    );
  }
}
