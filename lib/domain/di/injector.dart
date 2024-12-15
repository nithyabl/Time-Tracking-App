import 'package:kiwi/kiwi.dart';
import 'package:time_tracking_app_new/data/api/task_api.dart';
import 'package:time_tracking_app_new/data/local/database_service.dart';
import 'package:time_tracking_app_new/domain/repo/task_repository.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/tasks/tasks_bloc.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/theme/theme_cubit.dart';

part 'injector.g.dart';

abstract class Injector {
  static late KiwiContainer container;

  static Future<bool> setup() async {
    container = KiwiContainer();

    _$Injector()._configure();
    return true;
  }

  static final T Function<T>([String]) resolve = container.resolve;

  void _configure() {
    _registerServices();
    _registerRepositories();
  }

  /// Register  services

  @Register.singleton(DatabaseManager)
  @Register.singleton(TaskApi)
  void _registerServices();

  /// Register repository and Bloc

  @Register.singleton(TaskRepository)
  @Register.singleton(TasksBloc)
  @Register.singleton(ThemeCubit)
  void _registerRepositories();
}
