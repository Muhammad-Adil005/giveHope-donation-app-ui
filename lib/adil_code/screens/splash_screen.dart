import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../routes/routes.dart';
import '../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, AdilRoutes.introViewScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            20.height,
            Lottie.asset(
              "assets/images/donation_intro.json",
              repeat: false,
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
            const Text(
              "Welcome to GiveHope",
              style: TextStyle(
                color: AppColor.themeColor,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ).padAll(8),
          ],
        ),
      ),
    );
  }
}
