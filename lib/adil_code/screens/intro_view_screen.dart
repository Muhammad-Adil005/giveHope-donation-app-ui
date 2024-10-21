import 'package:donation_app/adil_code/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../utils/utils.dart';

class IntroViewScreen extends StatefulWidget {
  const IntroViewScreen({super.key});

  @override
  State<IntroViewScreen> createState() => _IntroViewScreenState();
}

class _IntroViewScreenState extends State<IntroViewScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          IntroductionScreen(
            pages: [
              PageViewModel(
                titleWidget: buildTitle(
                  "Welcome to ",
                  "GiveHope ",
                  "platform",
                  size,
                ),
                bodyWidget: buildBody(
                    'GiveHope believe that We make a living by what we get, but we make a life by what we give. Believe you can and you are halfway there. – Theodore Roosevelt',
                    size),
                image: buildImage('assets/images/intro2.png', size),
                decoration: getPageDecoration(size),
              ),
              PageViewModel(
                titleWidget: buildTitle(
                  "Join hands, to make better ",
                  "Hope",
                  "",
                  size,
                ),
                bodyWidget: buildBody(
                    'Donating clothes is a simple yet impactful way to support those in need and promote Hope. Charity begins at home, but should not end there',
                    size),
                image: buildImage('assets/images/intro3.png', size),
                decoration: getPageDecoration(size),
              ),
              PageViewModel(
                titleWidget: buildTitle(
                  "Let's make the world better with ",
                  "GiveHope!",
                  "",
                  size,
                ),
                bodyWidget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildBody(
                        'GiveHope is a platform where your generosity meets impact! Join us in making a difference.',
                        size),
                    SizedBox(height: size.height * 0.05),
                    // Get Started button with navigation
                    buildButton(
                      text: "Get Started",
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AdilRoutes.signUpScreen);
                      },
                    ),
                  ],
                ),
                image: buildImage('assets/images/last2.png', size),
                decoration: getPageDecoration(size),
              ),
            ],
            onDone: () {
              Navigator.of(context)
                  .pushReplacementNamed(AdilRoutes.signUpScreen);
            },
            onSkip: () {
              Navigator.of(context)
                  .pushReplacementNamed(AdilRoutes.signUpScreen);
            },
            showSkipButton: false,
            next: buildButton(icon: Icons.arrow_forward),
            done: const SizedBox.shrink(),
            dotsDecorator: getDotsDecorator(size),
          ),
          Positioned(
            top: size.height * 0.05,
            right: size.width * 0.05,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(AdilRoutes.signUpScreen);
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: AppColor.themeColor,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String path, Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: Center(
        child: Image.asset(
          path,
          width: size.width * 0.6,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildTitle(String title1, title2, title3, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: size.height * 0.035),
          children: [
            TextSpan(
                text: title1,
                style: const TextStyle(
                    color: Colors.black, fontFamily: "Poppins")),
            TextSpan(
                text: title2,
                style: const TextStyle(
                    color: AppColor.themeColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins")),
            TextSpan(
                text: title3,
                style: const TextStyle(
                    color: Colors.black, fontFamily: "Poppins")),
          ],
        ),
        textAlign: TextAlign.left, // Align text to left
      ),
    );
  }

  Widget buildBody(String body, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Text(
        body,
        style: TextStyle(
          fontSize: size.height * 0.022,
          fontFamily: "Poppins",
          color: Colors.grey.shade600,
          height: 1.5,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  PageDecoration getPageDecoration(Size size) {
    return PageDecoration(
      imagePadding: EdgeInsets.all(size.height * 0.02),
      titlePadding: EdgeInsets.only(
          left: 0,
          bottom: size.height * 0.01,
          right: size.width * 0.04,
          top: size.height * 0.02),
      bodyPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      pageColor: AppColor.backgroundBodyColor,
    );
  }

  DotsDecorator getDotsDecorator(Size size) {
    return DotsDecorator(
      color: Colors.green.shade100,
      activeColor: AppColor.themeColor,
      size: Size(size.width * 0.02, size.height * 0.02),
      activeSize: Size(size.width * 0.1, size.height * 0.01),
      activeShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }

  Widget buildButton({String? text, IconData? icon, VoidCallback? onTap}) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: text != null ? size.width * 0.9 : size.width * 0.18,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.themeColor,
          borderRadius: BorderRadius.circular(size.height * 0.015),
        ),
        child: text != null
            ? Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    fontSize: 16,
                  ),
                ),
              )
            : Icon(
                icon,
                color: Colors.white,
              ),
      ),
    );
  }
}
