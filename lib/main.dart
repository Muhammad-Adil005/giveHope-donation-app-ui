import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'adil_code/routes/routes.dart';
import 'adil_code/utils/utils.dart';
import 'adil_code/view_model/links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupStripe();
  runApp(const MyApp());
}

Future<void> _setupStripe() async {
  Stripe.publishableKey = stripePublishableKey;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.themeColor),
        useMaterial3: true,
      ),
      initialRoute: AdilRoutes.initial,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
