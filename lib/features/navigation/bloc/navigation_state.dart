// lib/navigation_state.dart
part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final TabItem selectedTab;

  const NavigationState({
    this.selectedTab = TabItem.screen1,
  });

  NavigationState copyWith({
    TabItem? selectedTab,
  }) {
    return NavigationState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object> get props => [selectedTab];
}