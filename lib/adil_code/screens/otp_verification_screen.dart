import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../routes/routes.dart';
import '../utils/utils.dart';

class OPTVerificationScreen extends StatefulWidget {
  const OPTVerificationScreen({super.key});

  @override
  OPTVerificationScreenState createState() => OPTVerificationScreenState();
}

class OPTVerificationScreenState extends State<OPTVerificationScreen> {
  String _enteredOTP = ''; // Variable to store entered OTP
  final String _correctOTP = '123456'; // Example correct OTP

  // Function to validate OTP
  bool _validateOTP(String enteredOTP) {
    if (enteredOTP.length != 6) {
      Fluttertoast.showToast(msg: 'Please enter a 6-digit OTP');
      return false;
    } else if (enteredOTP != _correctOTP) {
      Fluttertoast.showToast(msg: 'Invalid OTP. Please try again.');
      return false;
    }
    return true;
  }

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
                  padding: const EdgeInsets.all(8),
                  child:
                      const Icon(Icons.arrow_back, color: AppColor.themeColor),
                ),
              ),
              8.height,
              SmallWidgets.circularIcon(context, Icons.mail_lock_rounded),
              24.height,
              const Text(
                "Verification",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"),
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text:
                            "Enter code that was sent to your email for security.",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Poppins")),
                    TextSpan(
                        text: " GiveHope ",
                        style: TextStyle(
                            color: AppColor.themeColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins")),
                    TextSpan(
                        text: "account.",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Poppins")),
                  ],
                ),
              ),
              32.height,
              SmallWidgets.textIs("Enter 6 digit code"),
              8.height,
              PinCodeTextField(
                length: 6,
                obscureText: false,
                enablePinAutofill: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  activeColor: AppColor.themeColor,
                  activeFillColor: AppColor.themeColor,
                  inactiveColor: Colors.grey,
                  selectedColor: AppColor.themeColor,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 40,
                ),
                onChanged: (value) {
                  setState(() {
                    _enteredOTP = value; // Update OTP value
                  });
                },
                appContext: context,
              ),
              32.height,
              RoundButton(
                buttonText: "Verify",
                onPressed: () {
                  // if (_validateOTP(_enteredOTP)) {
                  //   // If OTP is correct, navigate to new password screen
                  //   Navigator.pushNamed(context, AdilRoutes.newPasswordScreen);
                  // }
                  Navigator.pushNamed(context, AdilRoutes.newPasswordScreen);
                },
              ),
            ],
          ).padAll(16),
        ),
      ),
    );
  }
}
