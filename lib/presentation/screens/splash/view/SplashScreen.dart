import 'package:flutter/material.dart';
import 'package:time_tracking_app_new/core/constants/image_constants.dart';
import 'package:time_tracking_app_new/core/constants/route_constants.dart';
import 'package:time_tracking_app_new/core/constants/string_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigateAfterDelay(context);

    return Scaffold(body: splashScreen);
  }

  Widget get appLogo => ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(
          ImageConstants.appIconPng,
          fit: BoxFit.cover,
          height: 130,
          width: 130,
        ),
      );

  Widget get spacingBetween => const SizedBox(
        height: 20,
      );

  Widget get splashScreen => Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appLogo,
                spacingBetween,
                const Text(
                  StringConstants.appName,
                  style: TextStyle(fontSize: 25, color: Colors.brown),
                ),
              ],
            ),
          ),
        ],
      );

  void navigateAfterDelay(BuildContext context) async {
    await Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.of(context)
            .pushReplacementNamed(RouteConstants.dashboardPath));
  }
}
