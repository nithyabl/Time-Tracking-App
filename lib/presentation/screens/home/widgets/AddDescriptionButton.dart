import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_app_new/core/theme/theme_colors.dart';
import 'package:time_tracking_app_new/data/model/task/task_response.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/tasks/tasks_bloc.dart';

import '../../../../core/constants/string_constants.dart';
import '../../../common_widgets/NameFieldDialog.dart';

class AddDescriptionButton extends StatelessWidget {
  const AddDescriptionButton({
    super.key,
    required this.task,
  });

  final TaskResponse task;

  @override
  Widget build(BuildContext context) {
    ThemeColors.updateColors(context);
    return TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => NameFieldDialog(
              title: StringConstants.description,
              onCreate: (String description) {
                task.description = description;
                context.read<TasksBloc>().add(UpdateTaskEvent(task: task));
              },
            ),
          );
        },
        child: Text(
          StringConstants.addDescription,
          style: TextStyle(fontSize: 20, color: ThemeColors.textColor),
        ));
  }
}
