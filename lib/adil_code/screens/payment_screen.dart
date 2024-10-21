import 'package:donation_app/adil_code/routes/route_constants.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../view_model/stripe_services.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController amountController = TextEditingController();
  final FocusNode amountFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, AdilRoutes.homeScreen);
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
                        context, Icons.attach_money_outlined),
                    16.height,
                    const Text(
                      "Payment",
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
                                  "Join the movement for change. Donate to give hope to ",
                              style: TextStyle(
                                  color: Colors.black, fontFamily: "Poppins")),
                          TextSpan(
                              text: " GiveHope",
                              style: TextStyle(
                                  color: AppColor.themeColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins")),
                          TextSpan(
                              text: " members",
                              style: TextStyle(
                                  color: Colors.black, fontFamily: "Poppins")),
                        ],
                      ),
                    ),
                    16.height,
                    SmallWidgets.textIs("Enter Amount"),
                    CustomTextField(
                        controllerIs: amountController,
                        hintTextIs: "Rs.3000",
                        focusNode: amountFocusNode,
                        keyboardApperanceType: TextInputType.number,
                        prefixIconIs: Icons.attach_money_rounded),
                    32.height,
                    RoundButton(
                      buttonText: "Next",
                      onPressed: () async {
                        if (amountController.text.isEmpty) {
                          DialogBox.errorDialogBox(
                              context, "Please enter an amount", "Warning");
                          return;
                        } else {
                          try {
                            await StripeService.instance
                                .makePayment(
                                    int.parse(amountController.text), context)
                                .then(
                              (value) {
                                print("Haider Ali ");
                              },
                            );
                            print("after the Stripe");
                            amountController.clear();
                          } catch (e) {
                            print('Error in payment process: $e');
                            DialogBox.errorDialogBox(
                                context, "Payment failed", "Try again.");
                          }
                        }
                      },
                    ),
                  ],
                ).padAll(16),
              ),
            ),
            // Show CircularProgressIndicator when isLoading is true
          ],
        ),
      ),
    );
  }
}
