import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_app_new/core/constants/route_constants.dart';
import 'package:time_tracking_app_new/core/constants/string_constants.dart';
import 'package:time_tracking_app_new/core/theme/theme_colors.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/theme/theme_cubit.dart';
import 'package:time_tracking_app_new/presentation/screens/home/widgets/AddTaskDialog.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController taskNameController = TextEditingController();
    final currentThemeMode = context.read<ThemeCubit>().getCurrentThemeMode();

    ThemeColors.updateColors(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringConstants.menu,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              tileColor: ThemeColors.textColor,
              leading: const Icon(Icons.list),
              title: Text(
                StringConstants.generalInstructions,
                style: TextStyle(
                  color: ThemeColors.textColor,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteConstants.generalInstructions,
                );
              },
            ),
            const Divider(),
            ListTile(
              tileColor: ThemeColors.backgroundColor,
              leading: const Icon(Icons.add_task),
              title: Text(
                StringConstants.addTask,
                style: TextStyle(
                  color: ThemeColors.textColor,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CreateTaskDialog(
                      taskNameController: taskNameController,
                    );
                  },
                );
              },
            ),
            const Divider(),
            darkModeButton(currentThemeMode, context)
          ],
        ),
      ),
    );
  }

  ListTile darkModeButton(String currentThemeMode, BuildContext context) {
    return ListTile(
      tileColor: ThemeColors.backgroundColor,
      leading: const Icon(Icons.dark_mode_rounded),
      title: Text(
        'Dark Mode',
        style: TextStyle(
          color: ThemeColors.textColor,
        ),
      ),
      trailing: Switch(
        value: currentThemeMode == StringConstants.dark,
        onChanged: (bool value) {
          context.read<ThemeCubit>().setThemeMode(
              value ? StringConstants.dark : StringConstants.light);

          setState(() {});
        },
      ),
    );
  }
}
