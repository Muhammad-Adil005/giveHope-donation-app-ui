import 'package:flutter/material.dart';

import '../routes/routes.dart';
import '../utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundBodyColor,
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColor.themeColor
                                .withOpacity(0.1), // Light shade of themeColor
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                            Icons.menu,
                            color: AppColor.themeColor,
                          ),
                        ),
                      );
                    },
                  ),
                  // Notification icon
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, AdilRoutes.notificationScreen);
                    },
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColor.themeColor
                            .withOpacity(0.1), // Light shade of themeColor
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(Icons.notifications_active,
                          color: AppColor.themeColor),
                    ),
                  ),
                ],
              ).padOnly(top: 16, bottom: 16),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 25),
                  children: [
                    TextSpan(
                        text: "Give",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Poppins")),
                    TextSpan(
                        text: " today, ",
                        style: TextStyle(
                            color: AppColor.themeColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins")),
                    TextSpan(
                        text: "so they can thrive",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Poppins")),
                    TextSpan(
                        text: " tomorrow!",
                        style: TextStyle(
                            color: AppColor.themeColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins")),
                  ],
                ),
              ),
              12.height,
              CustomTextField(
                  controllerIs: TextEditingController(),
                  keyboardApperanceType: TextInputType.text,
                  focusNode: FocusNode(),
                  hintTextIs: "Type to search here",
                  prefixIconIs: Icons.search),
              SmallWidgets.heading("Urgent Causes"),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PictureFrame(
                      targetText: "Target : Rs.50000",
                      titleText: "Donate for hungry people",
                      completion: 0.6,
                      imagesIs: "assets/images/start.jpg",
                      targetCompletion: "60%",
                    ),
                    PictureFrame(
                      targetText: "Target : Rs.300000",
                      titleText: "Donate Medicine for patient",
                      completion: 0.3,
                      imagesIs: "assets/images/medicine.jpg",
                      targetCompletion: "30%",
                    ),
                    PictureFrame(
                      targetText: "Target : Rs.100000",
                      titleText: "Donate Clothes",
                      completion: 0.7,
                      imagesIs: "assets/images/last.jpg",
                      targetCompletion: "70%",
                    ),
                    PictureFrame(
                      targetText: "Target : Rs.80000",
                      titleText: "Donate Money",
                      completion: 0.4,
                      imagesIs: "assets/images/center.jpg",
                      targetCompletion: "40%",
                    ),
                  ],
                ),
              ),
              SmallWidgets.heading("Our Achievements"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: const AchievementPictureFrame(
                      imagesIs: "assets/images/intro1.png",
                      titleText: "50+",
                      subTitleText: "Donation",
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: const AchievementPictureFrame(
                      imagesIs: "assets/images/intro2.png",
                      titleText: "70+",
                      subTitleText: "Volunteer",
                    ),
                  ),
                ],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: const AchievementPictureFrame(
                      imagesIs: "assets/images/intro3.png",
                      titleText: "50+",
                      subTitleText: "Smile Served",
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: const AchievementPictureFrame(
                      imagesIs: "assets/images/intro4.png",
                      titleText: "50+",
                      subTitleText: "NGO'S",
                    ),
                  ),
                ],
              ),
              SmallWidgets.heading("Our Services"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallWidgets.servicesSection(
                      context, "Supports", Icons.account_box_rounded),
                  SmallWidgets.servicesSection(
                      context, "Supports", Icons.question_answer_outlined),
                  SmallWidgets.servicesSection(
                      context, "Supports", Icons.support)
                ],
              ),
              12.height,
              SmallWidgets.heading("How can we help ?"),
              SmallWidgets.listTileIs(
                  "Volunteer",
                  "the text will wrap to the next line without causing overflow errors.",
                  Icons.volunteer_activism_rounded),
              20.height,
              SmallWidgets.listTileIs(
                  "Contribute Food",
                  "The text will wrap to the next line without causing overflow errors.",
                  Icons.fastfood_rounded),
              RoundButton(
                buttonText: "Donate now",
                onPressed: () {
                  Navigator.pushNamed(context, AdilRoutes.paymentScreen);
                },
              )
            ],
          ).padSymmetric(hor: 16),
        ),
      ),
    );
  }
}
