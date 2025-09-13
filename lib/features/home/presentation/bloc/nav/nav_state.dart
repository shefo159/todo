part of 'nav_bloc.dart';


sealed class NavState {
  int selectedIndex;
  NavState(this.selectedIndex);
}

final class NavInitial extends NavState {
  NavInitial() : super(0);
}
final class NavUpdated extends NavState {
  NavUpdated(super.index);
}
