// lib/main_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/navigation/bloc/navigation_bloc.dart';
import 'features/navigation/tab_item.dart';
import 'screens/screen3.dart';
import 'screens/screen4.dart';
import 'screens/screen1.dart';
import 'screens/screen2.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // Карта для связи вкладок с экранами
  final Map<TabItem, Widget> _screens = const {
    TabItem.screen1: Screen1(),
    TabItem.screen2: Screen2(),
    TabItem.screen3: Screen3(),
    TabItem.screen4: Screen4(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.selectedTab.label),
          ),
          body: _screens[state.selectedTab],
          bottomNavigationBar: _buildBottomNavigationBar(context, state.selectedTab),
        );
      },
    );
  }

  // Создаем кастомный BottomNavigationBar
  Widget _buildBottomNavigationBar(BuildContext context, TabItem selectedTab) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3), //withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedTab.index,
        onTap: (index) {
          final tab = TabItem.values[index];
          context.read<NavigationBloc>().add(TabChanged(tab));
        },
        selectedItemColor: Colors.green, // Цвет активной вкладки
        unselectedItemColor: Colors.grey, // Цвет неактивных вкладок
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        items: TabItem.values.map((tab) {
          // Определяем цвет иконки в зависимости от активности
          final isSelected = tab == selectedTab;
          
          return BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: isSelected
                  ? BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    )
                  : null,
              child: Icon(
                tab.icon,
                color: isSelected ? Colors.green : Colors.grey,
              ),
            ),
            label: tab.label,
            backgroundColor: Colors.white,
          );
        }).toList(),
      ),
    );
  }
}