import 'dart:async';

import 'package:animation_painter/paint_animation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    timer();
    super.initState();
  }

  timer() {
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const AnimationPainter()));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Lottie.asset(
            'assets/lottie_json/animation_lkayd7cd.json',
            fit: BoxFit.contain
        ),
      ),
    );
  }
}