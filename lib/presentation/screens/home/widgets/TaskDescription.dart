import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_app_new/core/theme/theme_colors.dart';
import 'package:time_tracking_app_new/data/model/task/task_response.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/tasks/tasks_bloc.dart';

import '../../../../core/constants/string_constants.dart';
import '../../../common_widgets/NameFieldDialog.dart';

class TaskDescription extends StatelessWidget {
  const TaskDescription({
    super.key,
    required this.task,
  });

  final TaskResponse task;

  @override
  Widget build(BuildContext context) {
    ThemeColors.updateColors(context);
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ThemeColors.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.dehaze_sharp,
            color: ThemeColors.textColor,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              task.description ?? "",
              style: TextStyle(color: ThemeColors.textColor, fontSize: 15),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.edit, color: ThemeColors.textColor),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => NameFieldDialog(
                  title: StringConstants.description,
                  name: task.description,
                  isRequired: false,
                  onCreate: (String description) {
                    task.description = description;
                    context.read<TasksBloc>().add(UpdateTaskEvent(task: task));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
