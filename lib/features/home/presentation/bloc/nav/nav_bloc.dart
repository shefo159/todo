
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavInitial()) {
    on<NavIndexChanged>((event, emit) {
      final newIndex = event.newIndex;
      emit(NavUpdated(newIndex));
    });
  }
}
