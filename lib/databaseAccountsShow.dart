// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:library_app/accountsModel.dart';
import 'package:library_app/SecretaccountUpdate.dart';
import 'package:library_app/main.dart';

import 'bookModel.dart';

class databaseAccounts extends StatefulWidget {
  const databaseAccounts({super.key});

  @override
  State<databaseAccounts> createState() => _databaseAccountsState();
}

class _databaseAccountsState extends State<databaseAccounts> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<accountsModel>> fetchAccounts() async {
    final querySnapshot = await _firestore
        .collection('accounts')
        .get(); //******* HERE IS DATABASE NAME */
    final Books1 = querySnapshot.docs
        .map((doc) => accountsModel.fromJson(doc.data()))
        .toList();
    log(Books1.toString());
    return Books1;
  }

  @override
  void initState() {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio('images/accountsDB.mp3'),
    );

    super.initState();
  }

//************************************ */
  // ISKO EK BAAR CHALANA HAI
  // Future<void> addAccount() async {
  //   accountsModel account = accountsModel(
  //       book_id: 'dummy', //*********************************************** */
  //       id: 'dummy', //  THIS FUNCTION IS FO CREATING accounts ka ya books ka table from code itself instead of from manually in FIREBASE
  //       issueDate: 'dummy', //*********************************************** */
  //       name: 'dummy',
  //       password: 'dummy');
  //   await _firestore.collection('accounts').add(account.toJson());
  // }

  // @override
  // void initState() {
  //   addAccount();
  //   // fetchAccounts();

  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          // shape: const OvalBorder(),
          backgroundColor: Colors.green,
          title: const Text('Accounts Database', style: colorizeTextStyle3)),
      body: FutureBuilder(
        future: fetchAccounts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching Accounts'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final Accounts = snapshot.data;

          return ListView.builder(
            itemCount: Accounts?.length,
            itemBuilder: (context, index) {
              final Account = Accounts![index];

              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: Text(Account.id, style: colorizeTextStyle32),
                ),
                title: Text(
                  '       ' + Account.name,
                  style: colorizeTextStyle32,
                ),
                subtitle: Text('     ' + Account.issueDate.toString(),
                    style: colorizeTextStyle32),
                trailing: Text(Account.book_id, style: colorizeTextStyle32),
              );
            },
          );
        },
      ),
    );
  }
}


// children: [
              // const SizedBox(
              //   height: 600,
              //   child: ListTile(
              //     leading: Text('ID'),
              //     title: Text('name'),
              //     subtitle: Text('issue_Date'),
              //     trailing: Text('book_id'),
              //   ),
              // ),
          //     ListView.builder(
          //       itemCount: Accounts?.length,
          //       itemBuilder: (context, index) {
          //         final Account = Accounts![index];

          //         return ListTile(
          //           leading: CircleAvatar(
          //             child: Text(Account.id),
          //           ),
          //           title: Text(Account.name),
          //           subtitle: Text(Account.issueDate.toString()),
          //           trailing: Text(Account.book_id),
          //         );
          //       },
          //     ),
          //   ],
          // );