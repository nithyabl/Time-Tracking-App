import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:time_tracking_app_new/core/constants/route_constants.dart';
import 'package:time_tracking_app_new/presentation/screens/general_instructions/view/general_instructions_view.dart';
import 'package:time_tracking_app_new/presentation/screens/home/view/DashboardScreen.dart';
import 'package:time_tracking_app_new/presentation/screens/offlineView/OfflineView.dart';
import 'package:time_tracking_app_new/presentation/screens/splash/view/SplashScreen.dart';

class AppRoutes {
  Route generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (_) => OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            List<ConnectivityResult> connectivityResult, Widget child) {
          final bool connected =
              !connectivityResult.contains(ConnectivityResult.none);
          if (!connected) {
            return const OfflineView();
          }
          return displayView(routeSettings);
        },
        child: const SizedBox.shrink(),
      ),
      settings: routeSettings,
    );
  }

  Widget displayView(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case RouteConstants.splashPath:
        return const SplashScreen();
      case RouteConstants.dashboardPath:
        return const Dashboardscreen();
      case RouteConstants.generalInstructions:
        return const GeneralInstructionsView();
      default:
        return const SplashScreen();
    }
  }
}
