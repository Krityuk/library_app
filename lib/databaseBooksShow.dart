// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:developer';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:library_app/bookModel.dart';
import 'package:library_app/main.dart';

class databaseBooks extends StatefulWidget {
  const databaseBooks({super.key});

  @override
  State<databaseBooks> createState() => _databaseBooksState();
}

class _databaseBooksState extends State<databaseBooks> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BookModel>> fetchBooks() async {
    final querySnapshot = await _firestore
        .collection('books')
        .get(); //******* HERE IS DATABASE NAME */
    final Books1 = querySnapshot.docs
        .map((doc) => BookModel.fromJson(doc.data()))
        .toList();
    log(Books1.toString());
    return Books1;
  }

  @override
  void initState() {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio('images/booksDb.mp3'),
    );

    super.initState();
  }

  // @override
  // void initState() {
  //   fetchAccounts();

  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'Books Database',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
          // const ListTile(
          //   leading: Text('Book_ID'),
          //   title: Text('book_name'),
          //   trailing: Text('count'),
          // ),
          ),
      body: FutureBuilder(
        future: fetchBooks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching BookList'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final Books = snapshot.data;

          return ListView.builder(
            itemCount: Books?.length,
            itemBuilder: (context, index) {
              final Book = Books![index];

              return Container(
                decoration: const BoxDecoration(
                    gradient: SweepGradient(colors: colorizeColors)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text(
                      Book.book_id,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    Book.book_name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    Book.book_count,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
