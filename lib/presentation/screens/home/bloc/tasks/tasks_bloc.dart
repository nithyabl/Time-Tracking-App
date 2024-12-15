import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_app_new/core/constants/string_constants.dart';
import 'package:time_tracking_app_new/core/constants/task_board.dart';
import 'package:time_tracking_app_new/data/model/task/comment_res.dart';
import 'package:time_tracking_app_new/data/model/task/completed_task_res.dart';
import 'package:time_tracking_app_new/data/model/task/task_response.dart';

import '../../../../../domain/repo/task_repository.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TaskRepository _taskRepository;

  TasksBloc({required TaskRepository taskRepository})
      : _taskRepository = taskRepository,
        super(TasksInitial(tasks: [])) {
    on<GetTasksEvent>(_getTasksEvent);
    on<CreateTaskEvent>(_createTaskEvent);
    on<GetCommentsEvent>(_getCommentsEvent);
    on<AddCommentEvent>(_addCommentEvent);
    on<UpdateTaskEvent>(_updateTaskEvent);
    on<DeleteTaskEvent>(_deleteTaskEvent);
    on<TaskCompleteEvent>(_taskCompleteEvent);
    on<UndoCompleteEvent>(_undoCompleteEvent);
    on<HistoryEvent>((event, emit) => emit(
        HistorySuccess(historyTasks: event.historyTasks, tasks: state.tasks)));
  }

  void _createTaskEvent(CreateTaskEvent event, Emitter<TasksState> emit) async {
    emit(TasksLoading(tasks: state.tasks));
    try {
      await _taskRepository
          .createTask(name: event.name, projectId: event.projectId)
          .then((response) {
        print('state in response ${response.state}');
        state.tasks?.add(response);
        response.state = TaskBoard.todo.stringValue;
        emit(TasksSuccess(tasks: state.tasks));
      });
    } catch (exception) {
      emit(TasksFailure(message: exception.toString(), tasks: state.tasks));
    }
  }

  void _getTasksEvent(GetTasksEvent event, Emitter<TasksState> emit) async {
    emit(TasksLoading(tasks: state.tasks));
    try {
      await _taskRepository
          .getAllTasks(projectId: event.projectId)
          .then((dbResponse) {
        state.tasks?.clear();
        state.tasks?.addAll(dbResponse);
        emit(TasksSuccess(tasks: state.tasks));
      });
    } catch (exception) {
      emit(TasksFailure(
          message: StringConstants.couldNotLoadData, tasks: state.tasks));
    }
  }

  void _deleteTaskEvent(DeleteTaskEvent event, Emitter<TasksState> emit) async {
    emit(TasksLoading(tasks: state.tasks));
    try {
      await _taskRepository
          .deleteTask(taskId: event.task.id ?? "")
          .then((response) {
        state.tasks?.remove(event.task);
        emit(TasksSuccess(tasks: state.tasks));
      });
    } catch (exception) {
      emit(TasksFailure(
          message: StringConstants.somethingWentWrong, tasks: state.tasks));
    }
  }

  void _getCommentsEvent(
      GetCommentsEvent event, Emitter<TasksState> emit) async {
    try {
      await _taskRepository.getComments(taskId: event.taskId).then((comments) {
        final updatedTasks = state.tasks?.map((task) {
          if (task.id == event.taskId) {
            task.comments = comments;
            return task;
          }
          return task;
        }).toList();
        emit(TasksSuccess(tasks: updatedTasks));
      });
    } catch (exception) {
      emit(TasksFailure(
          message: StringConstants.couldNotLoadData, tasks: state.tasks));
    }
  }

  void _addCommentEvent(AddCommentEvent event, Emitter<TasksState> emit) async {
    try {
      await _taskRepository.addComment(comment: event.comment);
      emit(TasksSuccess(tasks: state.tasks));
    } catch (exception) {
      emit(TasksFailure(
          message: StringConstants.couldNotLoadData, tasks: state.tasks));
    }
  }

  void _updateTaskEvent(UpdateTaskEvent event, Emitter<TasksState> emit) async {
    try {
      await _taskRepository.updateTask(task: event.task);
      emit(TasksSuccess(tasks: state.tasks));
    } catch (exception) {
      emit(TasksFailure(
          message: StringConstants.somethingWentWrong, tasks: state.tasks));
    }
  }

  void _taskCompleteEvent(
      TaskCompleteEvent event, Emitter<TasksState> emit) async {
    try {
      await _taskRepository.addTaskToHistory(task: event.task);
      emit(TasksSuccess(tasks: state.tasks));
    } catch (exception) {
      emit(TasksFailure(
          message: StringConstants.somethingWentWrong, tasks: state.tasks));
    }
  }

  void _undoCompleteEvent(UndoCompleteEvent event, Emitter<TasksState> emit) {
    try {
      _taskRepository.deleteFromHistory(
          projectId: event.task.projectId ?? "", taskId: event.task.id ?? "");
    } catch (exception) {
      emit(TasksFailure(
          message: StringConstants.historyErrorMessage, tasks: state.tasks));
    }
  }
}
