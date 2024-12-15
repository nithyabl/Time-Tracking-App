import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boardview/board_item.dart';
import 'package:flutter_boardview/board_list.dart';
import 'package:flutter_boardview/boardview.dart';
import 'package:flutter_boardview/boardview_controller.dart';
import 'package:time_tracking_app_new/core/constants/app_constants.dart';
import 'package:time_tracking_app_new/core/constants/task_board.dart';
import 'package:time_tracking_app_new/core/theme/theme_colors.dart';
import 'package:time_tracking_app_new/data/model/task/completed_task_res.dart';
import 'package:time_tracking_app_new/data/model/task/task_response.dart';
import 'package:time_tracking_app_new/domain/utils/date_time_util.dart';
import 'package:time_tracking_app_new/presentation/common_widgets/AppLoader.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/tasks/tasks_bloc.dart';
import 'package:time_tracking_app_new/presentation/screens/home/widgets/TaskCard.dart';

class KanbanBoardWidget extends StatelessWidget {
  final List<TaskResponse>? tasks;
  const KanbanBoardWidget({super.key, this.tasks});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KanbanBoardPage(tasks: tasks),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KanbanBoardPage extends StatefulWidget {
  final List<TaskResponse>? tasks;

  const KanbanBoardPage({super.key, this.tasks});

  @override
  State<KanbanBoardPage> createState() => _KanbanBoardPageState();
}

class _KanbanBoardPageState extends State<KanbanBoardPage> {
  final BoardViewController boardViewController = BoardViewController();

  void _onItemMoved(
      {int? fromIndex, int? toIndex, required TaskResponse task}) {
    if (fromIndex != toIndex && toIndex != null && fromIndex != null) {
      task.state = TaskBoard.values[toIndex].stringValue;
      context.read<TasksBloc>().add(UpdateTaskEvent(task: task));
      if (task.state == TaskBoard.done.stringValue) {
        context.read<TasksBloc>().add(TaskCompleteEvent(
            task: CompletedTaskResponse(
                projectId: AppConstants.PROJECT_ID,
                name: task.name,
                taskId: task.id,
                dateCompleted: DateTimeUtil.formatDate(DateTime.now()))));
      }
      if (TaskBoard.values[fromIndex] == TaskBoard.done) {
        context.read<TasksBloc>().add(UndoCompleteEvent(task: task));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors.updateColors(context);
    return BlocConsumer<TasksBloc, TasksState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BoardView(
                lists: List.generate(TaskBoard.values.length, (boardIndex) {
                  List<TaskResponse> boardTasks = state.tasks!
                      .where((task) =>
                          task.state ==
                          TaskBoard.values[boardIndex].stringValue)
                      .toList();
                  return BoardList(
                    onStartDragList: (int? listIndex) {},
                    onTapList: (int? listIndex) async {},
                    onDropList: (int? listIndex, int? oldListIndex) {},
                    headerBackgroundColor: ThemeColors.headerBackgroundColor,
                    backgroundColor: ThemeColors.backgroundColor,
                    header: [
                      boardHeader(
                        TaskBoard.values[boardIndex].stringValue,
                        ThemeColors.boardHeaderColor,
                      ),
                    ],
                    items: List.generate(
                      boardTasks.length,
                      (taskIndex) => BoardItem(
                        onStartDragItem: (int? listIndex, int? itemIndex,
                            BoardItemState state) {},
                        onDropItem: (int? listIndex,
                                int? itemIndex,
                                int? oldListIndex,
                                int? oldItemIndex,
                                BoardItemState state) =>
                            _onItemMoved(
                                fromIndex: oldListIndex,
                                toIndex: listIndex,
                                task: boardTasks[taskIndex]),
                        onTapItem: (int? listIndex, int? itemIndex,
                            BoardItemState state) async {},
                        item: TaskCard(task: boardTasks[taskIndex]),
                      ),
                    ),
                  );
                }),
                boardViewController: boardViewController,
              ),
            ),
            if (state is TasksLoading) const AppLoader()
          ],
        );
      },
    );
  }

  Widget boardHeader(String title, Color headerColor) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          decoration: TextDecoration.none,
          color: headerColor,
        ),
      ),
    );
  }
}
