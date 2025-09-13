part of 'nav_bloc.dart';


sealed class NavEvent {}
final class NavIndexChanged extends NavEvent {
  final int newIndex;
  NavIndexChanged(this.newIndex);
}
