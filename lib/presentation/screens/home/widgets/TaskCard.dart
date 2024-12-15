import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_app_new/core/theme/theme_colors.dart';
import 'package:time_tracking_app_new/data/model/task/task_response.dart';
import 'package:time_tracking_app_new/presentation/common_widgets/DeleteItemDialog.dart';
import 'package:time_tracking_app_new/presentation/common_widgets/NameFieldDialog.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/tasks/tasks_bloc.dart';
import 'package:time_tracking_app_new/presentation/screens/home/widgets/TaskDetails.dart';

import '../../../../core/constants/string_constants.dart';
import '../../../../core/constants/task_board.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});
  final TaskResponse task;

  void _editTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => NameFieldDialog(
        title: StringConstants.editName,
        name: task.name ?? "",
        onCreate: (String name) {
          task.name = name;
          context.read<TasksBloc>().add(UpdateTaskEvent(task: task));
        },
      ),
    );
  }

  void _deleteTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DeleteItemDialog(
        itemName: "${StringConstants.delete}: ${task.name}",
        onDelete: () {
          context.read<TasksBloc>().add(DeleteTaskEvent(task: task));
          if (task.state == TaskBoard.done.stringValue) {
            context.read<TasksBloc>().add(UndoCompleteEvent(task: task));
          }
        },
      ),
    );
  }

  void _showTaskDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 500,
            ),
            child: TaskDetails(
              task: task,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors.updateColors(context);
    return GestureDetector(
      onTap: () => _showTaskDetails(context),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: ThemeColors.headerBackgroundColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                task.name ?? "",
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  color: ThemeColors.textColor,
                ),
              ),
            ),
            edit(context),
            const SizedBox(
              width: 5,
            ),
            delete(context),
          ],
        ),
      ),
    );
  }

  SizedBox delete(BuildContext context) {
    return SizedBox(
      width: 25,
      child: IconButton(
        icon: Icon(
          Icons.delete,
          size: 20,
          color: ThemeColors.textColor,
        ),
        onPressed: () => _deleteTask(context),
      ),
    );
  }

  SizedBox edit(BuildContext context) {
    return SizedBox(
      width: 25,
      child: IconButton(
        icon: Icon(
          Icons.edit,
          size: 20,
          color: ThemeColors.textColor,
        ),
        onPressed: () => _editTask(context),
      ),
    );
  }
}
