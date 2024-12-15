import 'package:flutter/material.dart';
import 'package:time_tracking_app_new/core/constants/color_constants.dart';
import 'package:time_tracking_app_new/core/constants/string_constants.dart';
import 'package:time_tracking_app_new/core/theme/theme_colors.dart';

class DeleteItemDialog extends StatelessWidget {
  const DeleteItemDialog({
    super.key,
    required this.itemName,
    required this.onDelete,
  });
  final VoidCallback onDelete;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    ThemeColors.updateColors(context);
    return AlertDialog(
      backgroundColor: ThemeColors.dialogBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        itemName,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ThemeColors.textColor,
        ),
      ),
      actions: [
        cancelButton(context),
        deleteButton(context),
      ],
    );
  }

  Widget cancelButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        overlayColor: ColorConstants.cyan,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        StringConstants.cancel,
        style: TextStyle(color: ThemeColors.textColor),
      ),
    );
  }

  Widget deleteButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () {
        Navigator.of(context).pop();
        onDelete();
      },
      child: const Text(
        StringConstants.delete,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
