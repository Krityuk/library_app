// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:library_app/landing_page.dart';

// void main() => runApp(const MyApp());

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

const colorizeColors = [
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
];

const colorizeColorsAccountDatabase = [
  Color.fromARGB(255, 6, 50, 59),
  Color.fromARGB(255, 77, 7, 2),
  Color.fromARGB(255, 14, 93, 157),
  Color.fromARGB(255, 24, 22, 4),
  Color.fromARGB(255, 31, 9, 35),
  Color.fromARGB(255, 11, 5, 55),
  Color.fromARGB(255, 4, 48, 83),
  Colors.black,
  Color.fromARGB(255, 6, 50, 59),
  Color.fromARGB(255, 77, 7, 2),
  Color.fromARGB(255, 16, 89, 148),
  Color.fromARGB(255, 24, 22, 4),
  Color.fromARGB(255, 31, 9, 35),
  Color.fromARGB(255, 11, 5, 55),
  Color.fromARGB(255, 4, 48, 83),
  Colors.black,
  Color.fromARGB(255, 6, 50, 59),
  Color.fromARGB(255, 77, 7, 2),
  Colors.blue,
  Color.fromARGB(255, 24, 22, 4),
  Color.fromARGB(255, 31, 9, 35),
  Color.fromARGB(255, 11, 5, 55),
  Color.fromARGB(255, 4, 48, 83),
  Colors.black,
];
const colorizeColors2 = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
    fontSize: 35.0,
    fontFamily: 'Pacifico',
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        color: Colors.white,
        blurRadius: 15,
        offset: Offset(0, 3),
      ),
    ]);

const colorizeTextStyle3 =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const colorizeTextStyle32 =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
const colorizeTextStyle2 =
    TextStyle(fontSize: 25.0, fontFamily: 'Lato', fontWeight: FontWeight.bold);

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
