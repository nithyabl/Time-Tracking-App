part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

final class GetTasksEvent extends TasksEvent {
  final String projectId;
  GetTasksEvent({required this.projectId});
}

final class CreateTaskEvent extends TasksEvent {
  final String projectId;
  final String name;

  CreateTaskEvent({required this.projectId, required this.name});
}

final class UpdateTaskEvent extends TasksEvent {
  final TaskResponse task;

  UpdateTaskEvent({required this.task});
}

final class GetCommentsEvent extends TasksEvent {
  final String taskId;
  GetCommentsEvent({required this.taskId});
}

final class AddCommentEvent extends TasksEvent {
  final CommentRes comment;

  AddCommentEvent({required this.comment});
}

final class DeleteTaskEvent extends TasksEvent {
  final TaskResponse task;
  DeleteTaskEvent({required this.task});
}

final class TaskCompleteEvent extends TasksEvent {
  final CompletedTaskResponse task;
  TaskCompleteEvent({required this.task});
}

final class UndoCompleteEvent extends TasksEvent {
  final TaskResponse task;
  UndoCompleteEvent({required this.task});
}

final class GetHistoryEvent extends TasksEvent {
  final String projectId;
  GetHistoryEvent({required this.projectId});
}

final class GetTaskInfoEvent extends TasksEvent {
  final String projectId;
  final String taskId;
  final List<CompletedTaskResponse> historyTasks;

  GetTaskInfoEvent(this.historyTasks,
      {required this.projectId, required this.taskId});
}

final class HistoryEvent extends TasksEvent {
  final List<CompletedTaskResponse> historyTasks;

  HistoryEvent(
    this.historyTasks,
  );
}
