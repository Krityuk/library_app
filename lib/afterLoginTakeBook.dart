// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:library_app/LoginPage.dart';
import 'package:library_app/accountsModel.dart';
import 'package:library_app/databaseBooksShow.dart';
import 'package:library_app/funcReturnTakeBook.dart';
import 'package:library_app/variables.dart';

class afterLoginTakeBook extends StatefulWidget {
  final accountsModel aaaccountModel;
  const afterLoginTakeBook({
    Key? key,
    required this.aaaccountModel,
  }) : super(key: key);

  @override
  State<afterLoginTakeBook> createState() => _afterLoginTakeBookState();
}

class _afterLoginTakeBookState extends State<afterLoginTakeBook> {
  TextEditingController bookIdcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Stack(children: [
          GestureDetector(
            child: Opacity(
              opacity: 0.8,
              child: Container(
                height: 777,
                width: 500,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        image: AssetImage('images/laptop.jpg'),
                        fit: BoxFit.fill)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 260, left: 50, right: 50),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side:
                                const BorderSide(color: Colors.blue, width: 4),
                          ),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const databaseBooks())),
                        child: const Text('See Books')),
                  ),
                ),
                TextField(
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: bookIdcontroller,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Enter Book ID here',
                      hintStyle: const TextStyle(color: Colors.white70),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.white, width: 4.0))),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 80,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side:
                                const BorderSide(color: Colors.blue, width: 4),
                          ),
                        ),
                        onPressed: () async {
                          final FirebaseFirestore _firestore =
                              FirebaseFirestore.instance;

                          var snapshot = await _firestore
                              .collection('books')
                              .doc(bookIdcontroller.text)
                              .get();

                          if (!snapshot.exists) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(seconds: 4),
                                    content: Text(
                                        'You Entered wrong book id,\nsee booksDB for correct id')));
                          }

                          //******************************************************************************* */
                          //when entered book id is existing, then:-
                          else {
                            bool _isNotHavingBook = false;
                            await fetchAccounts(widget.aaaccountModel.id,
                                    widget.aaaccountModel.password)
                                .then((value1) {
                              if (value1.book_id == '') {
                                _isNotHavingBook = true;
                                print(
                                    'hi ${value1.book_id}jidndidxnnnnnnnnnnnn $_isNotHavingBook');
                              }
                            });

                            funcFetchBookData(bookIdcontroller.text).then(
                              (value) async => int.parse(value.book_count) > 0
                                  //     &&
                                  // _isNotHavingBook //ye not having pehle hi check ho gya dobara check mat kr yaha
                                  ? {
                                      // note agar upar isNOThaving = true me await nai likhte to at this line isNotHaving=false hi reh jata
                                      // print('kjfdsbfshfgggggggggggg'),
                                      funcTakeBook(
                                          value, widget.aaaccountModel),
                                      Navigator.of(context).pop(),
                                      Navigator.of(context).pop(),
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              duration: Duration(seconds: 4),
                                              content: Text(
                                                  'Book Taken Successfully')))
                                    }
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration: Duration(seconds: 4),
                                          content: Text(
                                              'Sorry, zero copies of this book remianing\ncannot give book'))),
                            );
                          }
                        },
                        child: const Text('enter')),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
