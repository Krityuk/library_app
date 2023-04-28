// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_app/accountsModel.dart';
import 'package:library_app/bookModel.dart';

accountsModel dummy_account = accountsModel(
    id: 'dummy_id',
    name: 'name',
    book_id: 'book_id',
    issueDate: 'issueDate',
    password: 'password');

BookModel dummy_book = BookModel(
    book_id: 'dummy_book_id', book_name: 'book_name', book_count: 'book_count');

var LoginID1;
var id_creating;
var pswd1;
bool isMale = true;
bool isSignup = false;
bool isRememberMe = true;

//////////////////////////////////////////////////////////////////////////////********* */

Future<accountsModel> funcCorrectLoginCheck(
    String final_id, String final_password) {
  return fetchAccounts(final_id, final_password);
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<accountsModel> fetchAccounts(
    String final_id, String final_password) async {
  try {
    final querySnapshot =
        await _firestore.collection('accounts').doc(final_id).get();
    final AccountData = accountsModel.fromJson(querySnapshot.data()!);

    if (final_password == AccountData.password) {
      // log(querySnapshot.data().toString());
      return AccountData; //********************************************* */
    }
  } catch (e) {
    return dummy_account; //yaha false return kr rhe the, and return accountsData me == return true tha
  }

  return dummy_account;
}
