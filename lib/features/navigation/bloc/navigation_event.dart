// lib/navigation_event.dart
part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class TabChanged extends NavigationEvent {
  final TabItem tab;

  const TabChanged(this.tab);

  @override
  List<Object> get props => [tab];
}