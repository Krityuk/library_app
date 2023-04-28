import 'package:flutter/material.dart';
// import 'package:bitbot/data/connecctions.dart';


class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height * 0.35,
        width: size.width,
        color: Colors.red,
        


      ),
    );
  }
}
