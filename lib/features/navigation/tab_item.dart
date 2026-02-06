// lib/tab_item.dart
import 'package:flutter/material.dart';

enum TabItem {
  screen1,
  screen2,
  screen3,
  screen4,
}

extension TabItemExtension on TabItem {
  String get label {
    switch (this) {
      case TabItem.screen1:
        return 'Screen1';
      case TabItem.screen2:
        return 'Screen2';
      case TabItem.screen3:
        return 'Screen3';
      case TabItem.screen4:
        return 'Screen4';
    }
  }

  IconData get icon {
    switch (this) {
      case TabItem.screen1:
        return Icons.home;
      case TabItem.screen2:
        return Icons.search;
      case TabItem.screen3:
        return Icons.favorite;
      case TabItem.screen4:
        return Icons.person;
    }
  }
}