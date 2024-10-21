import 'package:donation_app/adil_code/routes/route_constants.dart';
import 'package:donation_app/adil_code/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_color.dart';
import '../utils/button.dart';

class HappyScreen extends StatelessWidget {
  const HappyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundBodyColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Lottie.asset("assets/images/lock.json",
                    alignment: Alignment.center, repeat: false),
                Lottie.asset("assets/images/happy.json", repeat: false),
              ],
            ),
            const Text(
              "Congratulation",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"),
            ).padSymmetric(ver: 8),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: "Your new password created by ",
                      style: TextStyle(
                          color: Colors.black, fontFamily: "Poppins")),
                  TextSpan(
                      text: "GiveHope",
                      style: TextStyle(
                          color: AppColor.themeColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins")),
                  TextSpan(
                      text: " Successfully.",
                      style: TextStyle(
                          color: Colors.black, fontFamily: "Poppins")),
                ],
              ),
            ),
            RoundButton(
              buttonText: " Sign in ",
              onPressed: () {
                Navigator.pushNamed(context, AdilRoutes.signInScreen);
              },
            ),
          ],
        ).padAll(16),
      ),
    );
  }
}
