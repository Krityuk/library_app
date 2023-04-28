// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_app/accountsModel.dart';
import 'package:library_app/bookModel.dart';
import 'package:library_app/variables.dart';

void funcReturnBook(accountsModel accountData) {
  funcFetchBookData(accountData.book_id).then(
      (value) => UpdateBooksList(value)); // bookData is the map of each book
  UpdateAccountsList(accountData);
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> UpdateBooksList(BookModel bookData) async {
  BookModel a1 = BookModel(
      book_id: bookData.book_id,
      book_name: bookData.book_name,
      book_count: (int.parse(bookData.book_count) + 1)
          .toString()); //****************************************** */

  //******************************************************** */
  await _firestore.collection('books').doc(bookData.book_id).set(a1.toJson());
}

Future<void> UpdateAccountsList(accountsModel accountData) async {
  accountsModel a1 = accountsModel(
      id: accountData.id,
      name: accountData.name,
      book_id: '',
      issueDate: '',
      password: accountData.password);

  //******************************************************** */
  await _firestore.collection('accounts').doc(accountData.id).set(a1.toJson());
}

Future<BookModel> funcFetchBookData(String book_id) async {
  try {
    final querySnapshot =
        await _firestore.collection('books').doc(book_id).get();
    final BookData = BookModel.fromJson(querySnapshot.data()!);

    return BookData;
  } catch (e) {
    return dummy_book; //yaha false return kr rhe the, and return accountsData me == return true tha
  }
}


//*********************************************************************** */
//*********************************************************************** */
//*********************************************************************** */
void funcTakeBook(BookModel bookData, accountsModel accountData) {
  UpdateAccountsList1(accountData,bookData);
  UpdateBooksList1(bookData);
}



Future<void> UpdateBooksList1(BookModel bookData) async {
  BookModel a1 = BookModel(
      book_id: bookData.book_id,
      book_name: bookData.book_name,
      book_count: (int.parse(bookData.book_count) - 1)
          .toString()); //****************************************** */

  //******************************************************** */
  await _firestore.collection('books').doc(bookData.book_id).set(a1.toJson());
}

Future<void> UpdateAccountsList1(accountsModel accountData,BookModel bookData) async {
  accountsModel a1 = accountsModel(
      id: accountData.id,
      name: accountData.name,
      book_id: bookData.book_id,
      issueDate: '27-04-23',
      password: accountData.password);

  //******************************************************** */
  await _firestore.collection('accounts').doc(accountData.id).set(a1.toJson());
}
