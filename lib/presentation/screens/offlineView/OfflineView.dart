import 'package:flutter/material.dart';
import 'package:time_tracking_app_new/core/constants/image_constants.dart';
import 'package:time_tracking_app_new/core/constants/string_constants.dart';

class OfflineView extends StatelessWidget {
  const OfflineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          offlinePng,
          connectInternetWidget(context),
        ],
      ),
    );
  }
}

Widget get offlinePng => Image.asset(
      ImageConstants.offlinePng,
      fit: BoxFit.cover,
      height: 130,
      width: 130,
    );

Widget connectInternetWidget(BuildContext context) => Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            StringConstants.checkInternet,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          )),
    );
