// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:library_app/InserNewBooks.dart';
import 'package:library_app/databaseAccountsShow.dart';
import 'package:library_app/databaseBooksShow.dart';

class adminPageNext extends StatefulWidget {
  const adminPageNext({super.key});

  @override
  State<adminPageNext> createState() => _adminPageNextState();
}

class _adminPageNextState extends State<adminPageNext> {
  bool _flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            child: Container(
              height: 777,
              width: 500,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: AssetImage('images/mobileview2.jpg'),
                      fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 220,
              padding: const EdgeInsets.only(top: 90, left: 0, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Hello Admin ',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 255, 7, 7),
                      ),
                    ),
                  ),
                  const Text(
                    'Choose what you want to do',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 50,
                        fixedSize: const Size(150, 18),
                        backgroundColor: _flag
                            ? Colors.black87
                            : const Color.fromARGB(255, 39, 12, 2),
                        shape: const BeveledRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 53, 52, 90),
                                width: 1.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                    onPressed: () => {
                          setState(() => _flag = !_flag),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const databaseAccounts()))
                        },
                    child: const Text('See accountsDB')),
                const SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 50,
                        fixedSize: const Size(150, 18),
                        backgroundColor: _flag
                            ? Colors.black87
                            : const Color.fromARGB(255, 39, 12, 2),
                        shape: const BeveledRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 53, 52, 90),
                                width: 1.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                    onPressed: () => {
                          setState(() => _flag = !_flag),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const databaseBooks()))
                        },
                    child: const Text('See BooksDB')),
                const SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 50,
                        fixedSize: const Size(150, 18),
                        backgroundColor: _flag
                            ? Colors.black87
                            : Color.fromARGB(255, 12, 7, 5),
                        shape: const BeveledRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 53, 52, 90),
                                width: 1.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                    onPressed: () => {
                          setState(() => _flag = !_flag),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const InsertNewBook1()))
                        },
                    child: const Text('Insert new books')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
