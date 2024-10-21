import 'package:donation_app/adil_code/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                    Navigator.pushNamed(context, AdilRoutes.signUpScreen);
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
                64.height,
                const Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text:
                              "Join the movement for change. Sign in to make impact on",
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SmallWidgets.textIs("Email Address"),
                CustomTextField(
                    controllerIs: _emailController,
                    fieldValidator: MultiValidator([
                      RequiredValidator(errorText: "Email required"),
                      EmailValidator(errorText: "Enter a valid email"),
                    ]).call,
                    focusNode: _emailFocusNode,
                    nextFocusNode: _passwordFocusNode,
                    hintTextIs: "example@gmail.com",
                    keyboardApperanceType: TextInputType.emailAddress,
                    prefixIconIs: Icons.alternate_email),
                16.height,
                SmallWidgets.textIs("Password"),
                CustomTextField(
                    fieldValidator: MultiValidator([
                      RequiredValidator(errorText: "Password required"),
                      MinLengthValidator(8,
                          errorText:
                              "Password must be at least 8 characters long")
                    ]).call,
                    focusNode: _passwordFocusNode,
                    keyboardApperanceType: TextInputType.emailAddress,
                    controllerIs: _passwordController,
                    suffixIconIs: Icons.visibility_off,
                    prefixIconIs: Icons.lock),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AdilRoutes.forGotPasswordScreen);
                      },
                      child: const Text(
                        "Forget password",
                        style: TextStyle(
                            color: AppColor.themeColor, fontFamily: "Poppins"),
                      ),
                    )
                  ],
                ),
                32.height,
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                          context, AdilRoutes.homeScreen);
                    }
                  },
                  child: Container(
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.themeColor),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: AppColor.themeTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AdilRoutes.signUpScreen);
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: AppColor.themeColor, fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ).padAll(16),
        ),
      ),
    );
  }
}
