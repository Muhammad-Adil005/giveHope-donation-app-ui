import 'package:donation_app/adil_code/utils/utils.dart';
import 'package:flutter/material.dart';

class AchievementPictureFrame extends StatelessWidget {
  const AchievementPictureFrame(
      {this.imagesIs, this.titleText, this.subTitleText, super.key});
  final String? imagesIs;
  final String? titleText;
  final String? subTitleText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                image: DecorationImage(
                    image: AssetImage(imagesIs ?? ""), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleText ?? "",
              style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold),
            ),
            Text(
              subTitleText ?? "",
              style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold),
            ),
          ],
        ).padSymmetric(hor: 12, ver: 12),
      ],
    );
  }
}
