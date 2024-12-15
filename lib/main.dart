import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_app_new/core/config/app_routes.dart';
import 'package:time_tracking_app_new/core/config/navigator_key.dart';
import 'package:time_tracking_app_new/core/constants/route_constants.dart';
import 'package:time_tracking_app_new/core/constants/string_constants.dart';
import 'package:time_tracking_app_new/core/theme/theme_data.dart';
import 'package:time_tracking_app_new/core/utils/shared_prefernces_utils.dart';
import 'package:time_tracking_app_new/domain/di/injector.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/tasks/tasks_bloc.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injector.setup();
  await PreferenceUtils.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksBloc = Injector.container.resolve<TasksBloc>();
    final themeCubit = Injector.container.resolve<ThemeCubit>();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => tasksBloc,
          ),
          BlocProvider(
            create: (_) => themeCubit,
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final currentTheme = state as ThemeLoadedState;
            return MaterialApp(
              title: StringConstants.appName,
              navigatorKey: appNavigatorKey,
              themeMode: currentTheme.themeMode == StringConstants.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
              darkTheme: CustomThemeData.darkTheme,
              theme: CustomThemeData.lightTheme,
              onGenerateRoute: AppRoutes().generateRoute,
              initialRoute: RouteConstants.splashPath,
            );
          },
        ));
  }
}
