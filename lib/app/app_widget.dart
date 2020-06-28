import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_starter_template/bloc/counter_bloc.dart';
import 'package:flutter_modular_starter_template/bloc/theme_bloc.dart';
import 'package:flutter_modular_starter_template/data/theme_data.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => Modular.get<CounterBloc>()),
        BlocProvider<ThemeBloc>(create: (context) => Modular.get<ThemeBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, themeMode) => MaterialApp(
          initialRoute: "/",
          navigatorKey: Modular.navigatorKey,
          onGenerateRoute: Modular.generateRoute,
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: themeMode,
        ),
      ),
    );
  }
}
