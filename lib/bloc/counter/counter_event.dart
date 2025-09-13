part of 'counter_bloc.dart';


sealed class CounterEvent {}
class Increment extends CounterEvent {}
class Decrement extends CounterEvent {}
