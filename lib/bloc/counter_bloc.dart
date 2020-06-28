import 'package:flutter_bloc/flutter_bloc.dart';

enum Event { Increment, Decrement }

class CounterBloc extends Bloc<Event, int> {
  int initialValue = 0;

  @override
  int get initialState => initialValue;

  @override
  Stream<int> mapEventToState(Event event) async* {
    initialValue =
        event == Event.Increment ? initialValue + 1 : initialValue - 1;
    yield initialValue;
  }
}
