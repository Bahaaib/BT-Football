import 'package:bt_football/bloc/matches/matches_bloc.dart';
import 'package:bt_football/network/layers/network_performer.dart';
import 'package:bt_football/resources/themes.dart';
import 'package:bt_football/routing/main_router.gr.dart';
import 'package:bt_football/services/matches_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'network/layers/network_connectiviry.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    _injectDependencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      theme: AppThemes.englishAppTheme,
      builder: (_, widget) => widget ?? Container(),
    );
  }

  void _injectDependencies() {
    GetIt.instance.registerLazySingleton<Dio>(() => Dio());
    GetIt.instance.registerLazySingleton<NetworkConnectivity>(
        () => NetworkConnectivity());
    GetIt.instance
        .registerLazySingleton<NetworkPerformer>(() => NetworkPerformer());
    GetIt.instance
        .registerLazySingleton<MatchesService>(() => MatchesService());
    GetIt.instance.registerLazySingleton<MatchesBloc>(() => MatchesBloc());
  }

  @override
  void dispose() {
    GetIt.instance.reset();
    super.dispose();
  }
}
