import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_app_new/core/constants/uuid_generator.dart';
import 'package:time_tracking_app_new/core/theme/theme_colors.dart';
import 'package:time_tracking_app_new/data/model/task/comment_res.dart';
import 'package:time_tracking_app_new/data/model/task/task_response.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/tasks/tasks_bloc.dart';

import 'package:time_tracking_app_new/presentation/screens/home/widgets/TimerClock.dart';

import '../../../../core/constants/task_board.dart';
import 'AddComment.dart';
import 'AddDescriptionButton.dart';
import 'CommentSection.dart';
import 'TaskDescription.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails(
      {super.key,
      required this.task,
      this.isCompletedView = false,
      this.whenCompletedViewClosed});
  final TaskResponse task;
  final bool isCompletedView;
  final VoidCallback? whenCompletedViewClosed;

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  final TextEditingController _commentController = TextEditingController();
  late bool isTodo;

  @override
  void initState() {
    super.initState();
    isTodo = widget.task.state == TaskBoard.todo.stringValue;
    context
        .read<TasksBloc>()
        .add(GetCommentsEvent(taskId: widget.task.id ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors.updateColors(context);
    return Container(
      color: ThemeColors.tertiaryBackgroundColor,
      width: double.infinity,
      height: MediaQuery.of(context).size.height *
          (widget.isCompletedView ? 0.9 : (isTodo ? 0.6 : 0.7)),
      padding: const EdgeInsets.all(15),
      child: BlocConsumer<TasksBloc, TasksState>(listener: (context, state) {
        if (state is TasksFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      }, builder: (context, state) {
        return LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.isCompletedView)
                        completedTaskHeader(ThemeColors.closeIconColor),
                      if (!isTodo)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TimerClock(
                            initialTime: widget.task.timeSpent ?? 0,
                            task: widget.task,
                          ),
                        ),
                      widget.task.description == null ||
                              widget.task.description!.isEmpty
                          ? AddDescriptionButton(task: widget.task)
                          : TaskDescription(task: widget.task),
                      (widget.task.comments != null &&
                              widget.task.comments!.isNotEmpty)
                          ? Expanded(
                              child: CommentSection(
                                  comments: widget.task.comments ?? []),
                            )
                          : const Spacer(),
                      addCommentButton(context),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      }),
    );
  }

  AddComment addCommentButton(BuildContext context) {
    return AddComment(
      controller: _commentController,
      onSend: () {
        CommentRes comment = CommentRes(
            id: UUIDGenerator.generate(),
            taskId: widget.task.id,
            content: _commentController.text.trim());
        widget.task.comments?.add(comment);
        context.read<TasksBloc>().add(AddCommentEvent(comment: comment));
        _commentController.clear();
        FocusScope.of(context).unfocus();
      },
    );
  }

  Widget completedTaskHeader(Color closeIconColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              textAlign: TextAlign.start,
              widget.task.name ?? "",
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.visible),
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.whenCompletedViewClosed,
          child: Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(
              Icons.close_outlined,
              color: closeIconColor,
            ),
          ),
        )
      ],
    );
  }
}
