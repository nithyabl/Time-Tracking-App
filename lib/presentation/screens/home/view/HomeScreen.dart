import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_app_new/core/constants/app_constants.dart';
import 'package:time_tracking_app_new/core/constants/color_constants.dart';
import 'package:time_tracking_app_new/core/constants/string_constants.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/tasks/tasks_bloc.dart';
import 'package:time_tracking_app_new/presentation/screens/home/widgets/AddTaskDialog.dart';
import 'package:time_tracking_app_new/presentation/screens/home/widgets/boardWidget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    context.read<TasksBloc>().add(GetTasksEvent(
          projectId: AppConstants.PROJECT_ID,
        ));
  }

  void _showCreateTaskDialog(BuildContext context) {
    final TextEditingController taskNameController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CreateTaskDialog(
          taskNameController: taskNameController,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksBloc, TasksState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    StringConstants.welcome,
                    style: TextStyle(fontSize: 25),
                  ),
                  IconButton(
                    onPressed: () => _showCreateTaskDialog(context),
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                      color: ColorConstants.darkBrown,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              StringConstants.trackTimeMessage,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: KanbanBoardWidget(
              tasks: state.tasks,
            ))
          ],
        );
      },
    );
  }
}
