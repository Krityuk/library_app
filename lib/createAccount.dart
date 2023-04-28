// ignore_for_file: camel_case_types, use_build_context_synchronously, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:library_app/accountsModel.dart';

class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  TextEditingController id_creating = TextEditingController();

  TextEditingController name_creating = TextEditingController();

  // values are saved in these three variables
  TextEditingController password_creating = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addAccount(String final_id_creating, String final_name_creating,
      String final_password_creating) async {
    accountsModel a1 = accountsModel(
        id: final_id_creating,
        name: final_name_creating,
        issueDate: '',
        book_id: '',
        password: final_password_creating);

    //******************************************************** */
    var snapshot = await _firestore
        .collection('accounts')
        .doc(final_id_creating)
        .get(); // this line is checking that id entered is new(never used before) or not,i.e.. primary key
    if (snapshot.data() == null) {
      await _firestore
          .collection('accounts')
          .doc(final_id_creating)
          .set(a1.toJson());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 4),
          content: Text(
              'cannot add, This id already exist'))); //******************* */  Ye nai chal rha
    }
  }

  funcUploadtoFirebase() {
    addAccount(
      // final_password_creating.text.toString(),
      id_creating.text,
      name_creating.text,
      password_creating.text.toString(),
    );

    name_creating.clear();
    id_creating.clear();
    password_creating.clear();

    Navigator.of(context)
        .pop(); // ye line is just opp of navigator.push() i.e.. previous page par chale jaega isse
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28, top: 100),
        child: Container(
          height: 500,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black, blurRadius: 5, spreadRadius: 5)
              ]),
          child: Column(
            children: [
              const SizedBox(
                height: 120,
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Account Creation',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 0, bottom: 0),
                child: TextField(
                  controller: id_creating,
                  decoration: InputDecoration(
                      labelText: 'Fill a unique ID\ne.g..2001',
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 0, bottom: 0),
                child: TextField(
                  controller: name_creating,
                  // onSubmitted: (value) {
                  //   setState(() {
                  //     final_name_creating = name_creating.value.toString();
                  //   });
                  // },
                  decoration: InputDecoration(
                      labelText: 'Enter your name',
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 0, bottom: 0),
                child: TextField(
                  controller: password_creating,
                  // onSubmitted: (value) {
                  //   setState(() {
                  //     final_password_creating =
                  //         password_creating.value.toString();
                  //   });
                  // },
                  decoration: InputDecoration(
                      labelText: 'Create password',
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    if (id_creating.text.isEmpty ||
                        name_creating.text.isEmpty ||
                        password_creating.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Fill all above three values')));
                    } else {
                      funcUploadtoFirebase();
                    }
                  },
                  child: const Text('Create Account'))
            ],
          ),
        ),
      ),
    );
  }
}
