import 'package:flutter/material.dart';
import 'package:time_tracking_app_new/core/theme/theme_colors.dart';

class InstructionCard extends StatelessWidget {
  const InstructionCard({
    super.key,
    required this.instructionText,
    required this.instructionHeading,
  });

  final String instructionHeading;
  final String instructionText;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    ThemeColors.updateColors(context);

    return Container(
      width: deviceWidth,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeColors.secondaryBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$instructionHeading :',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: ThemeColors.textColor,
                ),
          ),
          Text(
            instructionText,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.textColor,
                ),
          ),
        ],
      ),
    );
  }
}
