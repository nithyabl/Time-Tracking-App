part of 'tasks_bloc.dart';

sealed class TasksState {
  List<TaskResponse>? tasks;
  TasksState({this.tasks});
}

final class TasksInitial extends TasksState {
  TasksInitial({super.tasks});
}

final class TasksLoading extends TasksState {
  TasksLoading({super.tasks});
}

final class TasksSuccess extends TasksState {
  TasksSuccess({super.tasks});
}

final class TasksFailure extends TasksState {
  final String message;
  TasksFailure({
    required this.message,
    super.tasks,
  });
}

final class HistorySuccess extends TasksState {
  final List<CompletedTaskResponse> historyTasks;
  final TaskResponse? selectedTask;

  HistorySuccess({
    required this.historyTasks,
    this.selectedTask,
    super.tasks,
  });
}
