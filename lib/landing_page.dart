// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:library_app/LoginPage.dart';
import 'package:library_app/SecretaccountUpdate.dart';
import 'package:library_app/adminPage.dart';
import 'package:library_app/main.dart';
import 'package:lottie/lottie.dart'; //animations

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // late final AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: SweepGradient(colors: [
        Colors.pink,
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.indigo,
        Colors.deepPurple,
      ])),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Stack(
            children: [
              // SizedBox(
              //   height: 30,
              //   width: 50,
              //   child: Lottie.asset('images/animation.json',
              //       controller: _controller, onLoaded: (composition) {
              //     _controller.duration = composition.duration;
              //   }),
              // ),
              // ElevatedButton(
              //     onPressed: () {
              //       _controller.reset();
              //       _controller.forward();
              //     },
              //     child: const Text('Touch me')),
              Container(
                height: 778,
                width: 500,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        image: AssetImage('images/wsx1.png'),
                        fit: BoxFit.fill)),
              ),
              Opacity(
                opacity: 0.2,
                child: SizedBox(
                  width: 500,
                  height: 900,
                  child: Image.asset(
                    "images/stars.gif",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                  top: 260,
                  child: SizedBox(
                    width: 362,
                    child: Center(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            'Welcome To Paradise',
                            textStyle: colorizeTextStyle,
                            colors: colorizeColors,
                          ),
                          ColorizeAnimatedText(
                            'IIITV-ICD\nLIBRARY',
                            textStyle: colorizeTextStyle,
                            colors: colorizeColors,
                          ),
                        ],
                        isRepeatingAnimation: true,
                        onTap: () {
                          print("Tap Event");
                          final assetsAudioPlayer = AssetsAudioPlayer();
                          assetsAudioPlayer.open(
                            Audio('images/welcome.mp3'),
                          );
                        },
                      ),
                    ),
                  )),
              // Opacity(
              //   opacity: 0.3,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 35, right: 35, top: 230),
              //     child: SizedBox(
              //       height: 1000,
              //       width: 300,
              //       child: Image.network(
              //           'https://thumbs.gfycat.com/AmbitiousConsciousJay.webp'),
              //     ),
              //   ),
              // ),
              Positioned(
                  top: 600,
                  left: 10,
                  right: 10,
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          // await insertAcc('hgddgjyuj', 'Jaideep', 'Jaiswal');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 32),
                            side: const BorderSide(width: 5),
                            backgroundColor:
                                const Color.fromARGB(255, 182, 11, 11),
                            shape: const BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)),
                            )),
                        child: const Text(
                          'Tap Here',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  )),
              Positioned(
                  top: 10,
                  left: 270,
                  child: IconButton(
                    color: Colors.amber,
                    icon: const Icon(
                      Icons.javascript_rounded,
                      // Icons.favorite,
                      // Icons.label,
                      // Icons.manage_history_sharp,
                      size: 80,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const adminPage()));
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
