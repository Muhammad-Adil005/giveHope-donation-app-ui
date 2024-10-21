import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../routes/routes.dart';
import '../utils/utils.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  NewPasswordScreenState createState() => NewPasswordScreenState();
}

class NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _cNewPasswordController = TextEditingController();
  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode cNewPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _cNewPasswordController.dispose();
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
                8.height,
                SmallWidgets.circularIcon(context, Icons.lock_clock_rounded),
                8.height,
                const Text(
                  "Create password",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: "Create your new password to secure your ",
                          style: TextStyle(
                              color: Colors.black, fontFamily: "Poppins")),
                      TextSpan(
                          text: " GiveHope",
                          style: TextStyle(
                              color: AppColor.themeColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins")),
                      TextSpan(
                          text: " account.",
                          style: TextStyle(
                              color: Colors.black, fontFamily: "Poppins")),
                    ],
                  ),
                ),
                16.height,
                SmallWidgets.textIs("New Password"),
                CustomTextField(
                    fieldValidator: MultiValidator([
                      RequiredValidator(errorText: "Password required"),
                      MinLengthValidator(8,
                          errorText:
                              "Password must be at least 8 characters long")
                    ]).call,
                    focusNode: newPasswordFocusNode,
                    nextFocusNode: cNewPasswordFocusNode,
                    suffixIconIs: Icons.visibility_off,
                    controllerIs: _newPasswordController,
                    hintTextIs: "new password",
                    keyboardApperanceType: TextInputType.number,
                    prefixIconIs: Icons.lock_rounded),
                8.height,
                SmallWidgets.textIs("Confirm New Password"),
                CustomTextField(
                    fieldValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm password is required";
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 characters long";
                      }
                      if (value != _newPasswordController.text) {
                        return "Passwords do not match";
                      }
                      return null; // Return null if there is no error
                    },
                    focusNode: cNewPasswordFocusNode,
                    controllerIs: _cNewPasswordController,
                    hintTextIs: "confirm new password",
                    suffixIconIs: Icons.visibility_off,
                    keyboardApperanceType: TextInputType.number,
                    prefixIconIs: Icons.lock_rounded),
                23.height,
                RoundButton(
                  buttonText: "Create new password",
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   Navigator.pushReplacementNamed(
                    //       context, AdilRoutes.happyScreen);
                    // }
                    Navigator.pushReplacementNamed(
                        context, AdilRoutes.happyScreen);
                  },
                ),
              ],
            ),
          ).padAll(16),
        ),
      ),
    );
  }
}
