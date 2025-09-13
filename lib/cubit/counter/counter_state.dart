part of 'counter_cubit.dart';

sealed class CounterState {
  int count;
  CounterState(this.count);
}

final class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

final class CounterValueChanged extends CounterState {
  CounterValueChanged(super.count);
}
