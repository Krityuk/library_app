// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:library_app/accountsModel.dart';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  class secretUpdate extends StatefulWidget {
  const secretUpdate({super.key});

  @override
  State<secretUpdate> createState() => _secretUpdateState();
}

class _secretUpdateState extends State<secretUpdate> {



  






  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// forcefully account creation code, agar unique id nai dale here to auto unique id generate ho jaega
Future<void> insertAcc(String final_id_creating, String final_name_creating,
    String final_password_creating) async {
  accountsModel a1 = accountsModel(
      id: final_id_creating,
      name: final_name_creating,
      password: final_password_creating,
      book_id: '',
      issueDate: '27-04-23');

  //******************************************************** */
      
    await _firestore
        .collection('accounts')
        .doc(final_id_creating)
        .set(a1.toJson());
    
}
