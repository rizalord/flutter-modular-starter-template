import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_starter_template/bloc/counter_bloc.dart';
import 'package:flutter_modular_starter_template/bloc/theme_bloc.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Modular Starter Template'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'You have pushed the button this many times:',
              ),
            ),
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) => Text(
                '$state',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Theme.of(context).primaryColor
                        : Colors.blue,
                    textColor: Colors.white,
                    onPressed: () =>
                        Modular.get<ThemeBloc>().add(ThemeMode.light),
                    child: Text('Light Mode'),
                  ),
                  SizedBox(width: 20.0),
                  RaisedButton(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Theme.of(context).primaryColor
                        : Colors.blue,
                    textColor: Colors.white,
                    onPressed: () =>
                        Modular.get<ThemeBloc>().add(ThemeMode.dark),
                    child: Text('Dark Mode'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => Modular.get<CounterBloc>().add(Event.Increment),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10.0),
          FloatingActionButton(
            onPressed: () => Modular.get<CounterBloc>().add(Event.Decrement),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
