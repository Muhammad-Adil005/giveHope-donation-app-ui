import 'package:donation_app/adil_code/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../utils/button.dart';
import '../utils/utils.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  PhoneNumberScreenState createState() => PhoneNumberScreenState();
}

class PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileNumController = TextEditingController();
  final _mobileNumFocusNode = FocusNode();

  @override
  void dispose() {
    _mobileNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
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
                      color: AppColor.themeColor
                          .withOpacity(0.1), // Light shade of themeColor
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.arrow_back,
                        color: AppColor.themeColor),
                  ),
                ),
                16.height,
                SmallWidgets.circularIcon(
                    context, Icons.phonelink_lock_rounded),
                24.height,
                const Text(
                  "Forget password",
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
                              "You forget your password ? don't worry cover your password with",
                          style: TextStyle(
                              color: Colors.black, fontFamily: "Poppins")),
                      TextSpan(
                          text: " GiveHope",
                          style: TextStyle(
                              color: AppColor.themeColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins")),
                    ],
                  ),
                ),
                16.height,
                SmallWidgets.textIs("Phone Number"),
                CustomTextField(
                    fieldValidator: MultiValidator([
                      RequiredValidator(errorText: "Phone Number required"),
                      PatternValidator(r'^03[0-9]{9}$',
                          errorText: "Enter valid Pakistani phone number"),
                    ]).call,
                    focusNode: _mobileNumFocusNode,
                    controllerIs: _mobileNumController,
                    hintTextIs: "0300-0000000",
                    keyboardApperanceType: TextInputType.number,
                    prefixIconIs: Icons.phone),
                16.height,
                RoundButton(
                  buttonText: "Next",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(
                          context, AdilRoutes.otpVerificationScreen);
                    }
                  },
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Try another way",
                        style: TextStyle(
                            color: AppColor.themeColor, fontFamily: "Poppins"),
                      )),
                )
              ],
            ),
          ).padAll(16),
        ),
      ),
    );
  }
}
