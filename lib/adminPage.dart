// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:library_app/adminPageNext.dart';

class adminPage extends StatefulWidget {
  const adminPage({super.key});

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  TextEditingController admin_pswd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Stack(children: [
          GestureDetector(
            child: Container(
              height: 777,
              width: 400,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: AssetImage(
                        'images/hack.jpg',
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 360, left: 50, right: 50),
            child: Column(
              children: [
                TextField(
                  controller: admin_pswd,
                  decoration: InputDecoration(
                      labelText: 'Write admin Password MAKRAT',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.white70, width: 8.0))),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 50,
                        fixedSize: const Size(150, 18),
                        backgroundColor: Colors.black87,
                        shape: const BeveledRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 53, 52, 90),
                                width: 1.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                    onPressed: () {
                      if (admin_pswd.text == 'makrat') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const adminPageNext()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Enter correct password MAKRAT')));
                        admin_pswd.clear();
                      }
                    },
                    child: const Text('enter')),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
