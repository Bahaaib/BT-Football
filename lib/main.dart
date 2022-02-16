import 'package:bt_football/bloc/observer/bloc_observer.dart';
import 'package:bt_football/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
        () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}