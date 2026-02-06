// lib/navigation_bloc.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../tab_item.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    on<TabChanged>(_onTabChanged);
  }

  void _onTabChanged(TabChanged event, Emitter<NavigationState> emit) {
    emit(state.copyWith(selectedTab: event.tab));
  }
}