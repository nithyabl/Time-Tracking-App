import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_app_new/core/constants/app_constants.dart';
import 'package:time_tracking_app_new/core/constants/string_constants.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/tasks/tasks_bloc.dart';

class CreateTaskDialog extends StatelessWidget {
  final TextEditingController taskNameController;

  const CreateTaskDialog({super.key, required this.taskNameController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(StringConstants.createNewTask),
      content: TextField(
        controller: taskNameController,
        decoration: const InputDecoration(
          labelText: StringConstants.taskName,
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(StringConstants.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            final taskName = taskNameController.text.trim();
            if (taskName.isNotEmpty) {
              context.read<TasksBloc>().add(
                    CreateTaskEvent(
                      name: taskName,
                      projectId: AppConstants.PROJECT_ID,
                    ),
                  );
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(StringConstants.taskCannotBeEmpty),
                ),
              );
            }
          },
          child: const Text(StringConstants.submit),
        ),
      ],
    );
  }
}
