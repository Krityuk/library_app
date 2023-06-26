// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

// import 'dart:developer'; // this package is for debug me print

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:library_app/accountsModel.dart';
import 'package:library_app/afterLoginPage.dart';
import 'package:library_app/variables.dart';  
import 'package:library_app/createAccount.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String final_id = '';
  String final_password = '';

  TextEditingController id_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio('images/login.mp3'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 229, 230, 231),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 220,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/download.jpg'),
                      fit: BoxFit.fill),
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 110, left: 0, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                     
                      Text(
                        '                                   Sign In to continue',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.red,
                              blurRadius: 15,
                              offset: Offset(0, 7),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
            top: 180,
            left: 40,
            right: 40,
            child: Container(
              height: 350, width: 280, padding: const EdgeInsets.all(20),
              // width: MediaQuery.of(context).size.width-40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black, blurRadius: 5, spreadRadius: 5)
                  ]),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignup = false;
                            });
                          },
                          child: Column(children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSignup
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                                  color: isSignup
                                      ? const Color.fromARGB(255, 204, 215, 215)
                                      : Colors.red),
                            ),
                            if (!isSignup)
                              Container(
                                height: 2,
                                color: Colors.orange,
                                width: 55,
                              )
                          ])),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignup = true;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const createAccount()));
                            });

                            Future.delayed(const Duration(seconds: 1), () {
                              setState(() {
                                isSignup = false;
                              });
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'SignUp',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: !isSignup
                                        ? FontWeight.normal
                                        : FontWeight.bold,
                                    color: !isSignup
                                        ? const Color.fromARGB(
                                            255, 204, 215, 215)
                                        : Colors.red),
                              ),
                              if (isSignup)
                                Container(
                                  height: 2,
                                  color: Colors.orange,
                                  width: 55,
                                )
                            ],
                          ))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 4, left: 10, right: 10),
                    child: TextField(
                      controller: id_controller,
                      onChanged: (value) {
                        setState(() {
                          final_id = value;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: 'Enter your ID here',
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 0),
                    child: TextField(
                      controller: password_controller,
                      onChanged: (value) {
                        // print(value + "password");
                        setState(() {
                          final_password = value;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: 'Enter password',
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (id_controller.text.isEmpty ||
                          password_controller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 4),
                                content: Text('fill above two values please')));
                      } else {
                        // print(final_id + "main");
                        // print(final_password + "main");
                        accountsModel flag = await funcCorrectLoginCheck(
                            final_id, final_password);
                        //THIS FUNCtion IS IN variables.dart FILE

                        if (flag.id == 'dummy_id') {
                          //==dummy_id matlab ki dummy account return hua
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 5),
                                  content:
                                      Text('This account doesn\'t exist')));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      seeAccount(aaccountsModel: flag)));
                          // CorrectLogin = false;
                        }
                        password_controller.clear();
                        id_controller.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text('Login'),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 450,
            child: Row(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Container(
                      height: 400,
                      width: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/library.jpg'),
                              fit: BoxFit.fill))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
