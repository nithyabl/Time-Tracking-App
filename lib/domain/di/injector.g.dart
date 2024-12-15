// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _registerServices() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => DatabaseManager())
      ..registerSingleton((c) => TaskApi());
  }

  @override
  void _registerRepositories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) =>
          TaskRepository(c.resolve<TaskApi>(), c.resolve<DatabaseManager>()))
      ..registerSingleton(
          (c) => TasksBloc(taskRepository: c.resolve<TaskRepository>()))
      ..registerSingleton((c) => ThemeCubit());
  }
}
