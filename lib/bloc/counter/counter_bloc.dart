import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<Increment>((event, emit) {
      emit(CounterValueChanged(state.count + 1));
    });
    on<Decrement>((event, emit) {
      emit(CounterValueChanged(state.count - 1));
    });
  }

}
