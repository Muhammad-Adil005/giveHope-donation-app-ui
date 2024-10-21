import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColor.themeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(12),
                  child:
                      const Icon(Icons.arrow_back, color: AppColor.themeColor),
                ),
              ),
              Center(
                child: Text('Profile Screen'),
              )
            ],
          ).padAll(16),
        ),
      ),
    );
  }
}
