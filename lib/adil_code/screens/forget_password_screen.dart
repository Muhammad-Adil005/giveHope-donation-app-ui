import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../routes/routes.dart';
import '../utils/utils.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ForgetPasswordScreenState createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  @override
  void dispose() {
    _emailController.dispose();
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
                      color: AppColor.themeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.arrow_back,
                        color: AppColor.themeColor),
                  ),
                ),
                24.height,
                SmallWidgets.circularIcon(context, Icons.lock_rounded),
                8.height,
                const Text(
                  "Forget password",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ).padOnly(top: 8),
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
                24.height,
                SmallWidgets.textIs("Email Address"),
                CustomTextField(
                    fieldValidator: MultiValidator([
                      RequiredValidator(errorText: "Email required"),
                      EmailValidator(errorText: "Enter valid email"),
                    ]).call,
                    focusNode: _emailFocusNode,
                    controllerIs: _emailController,
                    hintTextIs: "example@gmail.com",
                    keyboardApperanceType: TextInputType.emailAddress,
                    prefixIconIs: Icons.alternate_email),
                8.height,
                RoundButton(
                  buttonText: "Next",
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   Navigator.pushNamed(
                    //       context, AdilRoutes.otpVerificationScreen);
                    // }
                    Navigator.pushNamed(
                        context, AdilRoutes.otpVerificationScreen);
                  },
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AdilRoutes.phoneNumberScreen);
                    },
                    child: const Text(
                      "Try another way",
                      style: TextStyle(
                          color: AppColor.themeColor, fontFamily: "Poppins"),
                    ),
                  ),
                )
              ],
            ),
          ).padAll(16),
        ),
      ),
    );
  }
}
