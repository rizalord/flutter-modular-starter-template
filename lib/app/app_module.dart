import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_starter_template/app/app_widget.dart';
import 'package:flutter_modular_starter_template/bloc/counter_bloc.dart';
import 'package:flutter_modular_starter_template/bloc/theme_bloc.dart';
import 'package:flutter_modular_starter_template/routes/route.dart';

class AppModule extends MainModule {

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
    Bind((_) => CounterBloc()),
    Bind((_) => ThemeBloc()),
  ];

  // Provide all the routes for your module
  @override
  List<Router> get routers => route;

  // Provide the root widget associated with your module
  // In this case, it's the widget you created in the first step
  @override
  Widget get bootstrap => AppWidget();
}