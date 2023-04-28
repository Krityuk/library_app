// ignore_for_file: camel_case_types, use_build_context_synchronously, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:library_app/bookModel.dart';
import 'package:uuid/uuid.dart';

class InsertNewBook1 extends StatefulWidget {
  const InsertNewBook1({super.key});

  @override
  State<InsertNewBook1> createState() => _InsertNewBookState();
}

class _InsertNewBookState extends State<InsertNewBook1> {
  TextEditingController id_creating = TextEditingController();
  TextEditingController name_creating = TextEditingController();
  TextEditingController count_creating = TextEditingController();
  // values are saved in these three variables

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> insert(String final_id_creating, String final_name_creating,
      String final_count_creating) async {
    BookModel a1 = BookModel(
        book_id: final_id_creating,
        book_name: final_name_creating,
        book_count: final_count_creating);

    //******************************************************** */
    var snapshot = await _firestore
        .collection('books')
        .doc(final_id_creating)
        .get(); // this line is checking that id entered is new(never used before) or not,i.e.. primary key

    // print('${snapshot.data()}');
    // print(book1.book_id);
    if (snapshot.data() == null) {
      //snapshot.data() == null means this id is not present => unique/new
      await _firestore
          .collection('books')
          .doc(final_id_creating)
          .set(a1.toJson());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 4),
          content: Text('New ID book inserted successfully')));
    } else {
      BookModel book1 = BookModel.fromJson(snapshot.data()!);
      if (book1.book_name == final_name_creating) {
        await _firestore
            .collection('books')
            .doc(final_id_creating)
            .set(a1.toJson());

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(seconds: 4),
            content: Text(
                'Count of Book updated,\nBecause this ID exited already')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(seconds: 4),
            content: Text(
                'Book cannot be filled,\nBecause this ID already exist,\nso choose diff ID')));
      }
    }
  }

  var uuid = const Uuid();
  String atinstuuid = '';

  generateuuid() {
    //********/
    var temp = uuid.v4();
    setState(() {
      atinstuuid = temp;
    });
    return temp;
  }

  funcUploadtoFirebase() async {
    await insert(
      id_creating.text.isEmpty
          ? generateuuid() // IN TINO LINES KO UNCOMMENT KR DO TO GENERATE AUTO ID
          : id_creating
              .text, // if u leave empty this textfield then auto id is generated
      name_creating.text,
      count_creating.text.toString(),
    );
    id_creating.text.isNotEmpty ? name_creating.clear() : null;
    id_creating.clear();
    count_creating.clear();

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
                    'New Books Adding by Admin',
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
                      labelText:
                          'Fill a unique ID\n(Three digits format preferred)',
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
                      labelText: 'Enter book name',
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
                  controller: count_creating,
                  // onSubmitted: (value) {
                  //   setState(() {
                  //     final_count_creating =
                  //         count_creating.value.toString();
                  //   });
                  // },
                  decoration: InputDecoration(
                      labelText: 'Enter count',
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    // insert('gfugyfgfy', 'final_name_creating',
                    //     'final_count_creating');

                    if (id_creating.text.isEmpty ||
                        name_creating.text.isEmpty ||
                        count_creating.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Fill all above three values')));
                    } else {
                      await funcUploadtoFirebase();
                      // // agar upar me id_creating.text.isEmpty || ko hata de to ye likhna parega

                      // if (atinstuuid != '') {
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //       duration: const Duration(seconds: 15),
                      //       content: Text(
                      //           'Since you left id area empty, your auto generated unique id is: $atinstuuid ')));
                      // }
                    }
                  },
                  child: const Text('Process Insertion'))
            ],
          ),
        ),
      ),
    );
  }
}
