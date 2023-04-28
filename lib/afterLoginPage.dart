// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:library_app/accountsModel.dart';
import 'package:library_app/afterLoginTakeBook.dart';
import 'package:library_app/funcReturnTakeBook.dart';
import 'package:library_app/main.dart';

class seeAccount extends StatefulWidget {
  final accountsModel
      aaccountsModel; //************************************************* */
  const seeAccount({
    Key? key,
    required this.aaccountsModel,
  }) : super(key: key);

  @override
  State<seeAccount> createState() => _seeAccountState();
}

class _seeAccountState extends State<seeAccount> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/mobileview.jpg'), fit: BoxFit.fill)),
        child: Stack(
          children: [
            // Positioned(
            //     top: size.height * 0.16,
            //     width: size.height * 0.475,
            //     left: size.width * 0.1,
            //     child: Text(
            //       'Hello ${widget.aaccountsModel.name}',
            //       style: TextStyle(color: Colors.black),
            //     )),

            Positioned(
                top: size.height * 0.62,
                left: 115,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(140, 20),
                      backgroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.yellow, width: 2),
                      ),
                    ),
                    onPressed: () {
                      if (widget.aaccountsModel.book_id != '') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            duration: Duration(seconds: 4),
                            content: Text(
                                'You already having one book\nReturn that book first to take another book')));
                        Navigator.of(context).pop();
                      }
//****************************************************** */
                      else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => afterLoginTakeBook(
                                    aaaccountModel: widget
                                        .aaccountsModel // aaccountModel var ke wwidget ko aaa me dala,aaa would get passed,then next page me,"const xyz super.key" wali line ko hata ke waha final accountModel aaacountsmodel likho, then accountmodel par "ctrl+. krke generate constructor wala option",and accountSmodel par bhi ctrl+. krke add package accountsModel.dart
                                    )));
                      }
                    },
                    child: const Text('Take a book'))),
            Positioned(
                bottom: 160,
                left: 115,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(140, 20),
                      backgroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.yellow, width: 2),
                      ),
                    ),
                    onPressed: () {
                      if (widget.aaccountsModel.book_id == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 4),
                                content: Text('You not having any book')));
                      } else {
                        funcReturnBook(widget.aaccountsModel);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 4),
                                content: Text('Book Returned successfuly')));
                      }

                      Navigator.of(context).pop();
                    },
                    child: const Text('Return your book')))
          ],
        ));
  }
}
