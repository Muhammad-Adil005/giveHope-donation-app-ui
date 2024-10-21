import 'package:donation_app/adil_code/utils/utils.dart';
import 'package:flutter/material.dart';

import '../routes/routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.backgroundBodyColor,
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: AppColor.themeColor),
            accountName: Text(
              "Haider Ali",
              style:
                  TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "PIC",
                style: TextStyle(
                    color: AppColor.themeColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold),
              ),
            ),
            accountEmail: Text(
              "example@gmail.com",
              style: TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          ),
          DrawerTile(
            iconIs: const Icon(
              Icons.account_box,
              color: AppColor.themeColor,
            ),
            name: "Profile",
            function: () {
              Navigator.pushNamed(context, AdilRoutes.profileScreen);
            },
          ),
          DrawerTile(
            iconIs: const Icon(
              Icons.history,
              color: AppColor.themeColor,
            ),
            name: "Transaction History",
            function: () {},
          ),
          DrawerTile(
            iconIs: const Icon(
              Icons.rule,
              color: AppColor.themeColor,
            ),
            name: "Term & Condition",
            function: () {},
          ),
          DrawerTile(
            iconIs: const Icon(
              Icons.color_lens,
              color: AppColor.themeColor,
            ),
            name: "Change Theme",
            function: () {},
          ),
          DrawerTile(
            iconIs: const Icon(
              Icons.contact_phone_rounded,
              color: AppColor.themeColor,
            ),
            name: "Contact us",
            function: () {
              print("Tap ");
              Navigator.pushNamed(context, AdilRoutes.contactUsScreen);
            },
          ),
        ],
      ),
    );
  }
}
