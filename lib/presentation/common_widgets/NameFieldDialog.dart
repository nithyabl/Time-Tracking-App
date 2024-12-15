import 'package:flutter/material.dart';
import 'package:time_tracking_app_new/core/constants/string_constants.dart';
import 'package:time_tracking_app_new/core/theme/theme_colors.dart';

class NameFieldDialog extends StatefulWidget {
  const NameFieldDialog(
      {super.key,
      required this.title,
      required this.onCreate,
      this.name,
      this.isRequired = true});
  final Function(String) onCreate;
  final String title;
  final String? name;
  final bool isRequired;

  @override
  State<NameFieldDialog> createState() => _NameFieldDialogState();
}

class _NameFieldDialogState extends State<NameFieldDialog> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.name ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors.updateColors(context);
    return AlertDialog(
      backgroundColor: ThemeColors.dialogBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ThemeColors.textColor),
      ),
      content: nameField(),
      actions: [
        cancelButton(),
        saveButton(),
      ],
    );
  }

  Widget nameField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        style: TextStyle(color: ThemeColors.textColor),
        controller: nameController,
        decoration: InputDecoration(
          hintText: StringConstants.nameFieldHintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget saveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: ThemeColors.secondaryBackgroundColor),
      onPressed: () {
        String name = nameController.text.trim();
        if (widget.isRequired && name.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(StringConstants.nameFieldValidationMessage),
            ),
          );
        } else {
          Navigator.of(context).pop();
          widget.onCreate(name);
        }
      },
      child: Text(StringConstants.save,
          style: TextStyle(color: ThemeColors.boardHeaderColor)),
    );
  }

  Widget cancelButton() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        StringConstants.cancel,
        style: TextStyle(color: ThemeColors.boardHeaderColor),
      ),
    );
  }
}
