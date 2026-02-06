# appbloc
Flutter Bottom Navigation App with Multiple State Management Approaches - BloC and Provider

📱 Project Overview
A comprehensive Flutter application demonstrating various state management approaches and modern navigation. The app features 4 main tabs with different state management examples and navigation via go_router.

🎯 Key Features
1. BottomNavigationBar Navigation
4 tabs with individual styling

Green color for active tab

Smooth animations between screens

State preservation during tab switching

2. Multiple State Management Approaches
BLoC Pattern for counters and triangle

Provider Pattern (ChangeNotifier) for independent triangle

Cubit/Simple State Management for simple cases

Equatable for optimized state comparisons

3. Application Screens
   
📍 Screen 1 - Combined Features
BLoC-based counter (+/-/reset)

Interactive triangle with BLoC

90° rotation animation on click

Color toggle between red and green

Click count tracking

Navigation buttons to other screens

🔢 Screen 2 - Independent Counter
Second counter on separate BLoC

Complete independence from first counter

Advanced features (+1/+5/+10, -1/-5/-10)

Arbitrary value setting

Comparison with first counter

📊 Screen 3 - State Monitor
Display of all current states

Counter and triangle comparisons

Statistics and analytics

go_router navigation to DetailsScreen

Multiple navigation methods (go/push/goNamed)

🎨 Screen 4 - Provider Approach
Triangle with Provider (ChangeNotifier)

BLoC vs Provider comparison

Management of all states

Global reset for all counters

4. Modern Navigation with go_router
Declarative routing configuration

Named routes for convenience

Custom Back button handling

PopScope with onPopInvokedWithResult

Dynamic route parameters

5. DetailsScreen (go_router)
Separate screen with go_router navigation

Custom back button handling

Exit confirmation with unsaved data

State preservation before exit

Multiple return methods (pop/go)

🎨 UI/UX Features
Responsive design for different screen sizes

Animations for smooth user experience

Color scheme per tab (red/green/blue/purple)

Real-time state indicators

Unified AppBar displaying all states

🎯 Learning Objectives
Understanding differences between BLoC and Provider

Practice with go_router

Implementing complex navigation

Managing multiple independent states

Creating custom navigation handlers

📚 Key Learnings
This project serves as an excellent learning resource for:

Flutter state management patterns comparison

Modern navigation solutions in Flutter

Handling complex user interactions

Building maintainable Flutter applications

Implementing professional-grade Flutter features

🤝 Contributing
Feel free to fork this project and experiment with:

Adding new state management approaches (Riverpod, GetX)

Implementing more complex navigation scenarios

Adding automated tests

Enhancing UI/UX with custom animations

Integrating with backend APIs

📄 License
This project is open source and available for educational purposes.

This application is perfect for developers who want to understand different state management approaches in Flutter and learn modern navigation techniques with practical, hands-on examples.


📱 О проекте
Это полнофункциональное Flutter приложение, демонстрирующее различные подходы к управлению состоянием и навигации. Приложение включает 4 основные вкладки с разными примерами управления состоянием и современной навигацией через go_router.

🎯 Основные возможности
1. Навигация с BottomNavigationBar
4 вкладки с индивидуальным оформлением

Зеленый цвет активной вкладки

Анимация переключения между экранами

Сохранение состояния при переключении

2. Multiple State Management Approaches
BLoC Pattern для счетчиков и треугольника

Provider Pattern (ChangeNotifier) для независимого треугольника

Cubit/Simple State Management для простых случаев

Equatable для оптимизации сравнения состояний

3. Экраны приложения

📍 Screen 1 - Комбинированный экран
Счетчик на BLoC (+/-/сброс)

Интерактивный треугольник на BLoC

Анимация поворота на 90° при клике

Смена цвета с красного на зеленый

Отслеживание количества кликов

Кнопки навигации на другие экраны

🔢 Screen 2 - Независимый счетчик
Второй счетчик на отдельном BLoC

Полная независимость от первого счетчика

Расширенные функции (+1/+5/+10, -1/-5/-10)

Установка произвольных значений

Сравнение с первым счетчиком

📊 Screen 3 - Монитор состояний
Отображение всех текущих состояний

Сравнение счетчиков и треугольников

Статистика и аналитика

Навигация через go_router на DetailsScreen

Различные методы навигации (go/push/goNamed)

🎨 Screen 4 - Provider подход
Треугольник на Provider (ChangeNotifier)

Сравнение подходов BLoC vs Provider

Управление всеми состояниями

Глобальный сброс всех счетчиков

4. Modern Navigation with go_router
Декларативная маршрутизация

Named routes для удобства

Обработка кнопки Back с кастомной логикой

Использование PopScope с onPopInvokedWithResult

Динамические параметры маршрутов

5. DetailsScreen (go_router)
Отдельный экран с навигацией через go_router

Кастомная обработка возврата

Подтверждение выхода с несохраненными данными

Сохранение состояния перед выходом

Различные методы возврата (pop/go)

🎨 Особенности UI/UX
Адаптивный дизайн для разных размеров экранов

Анимации для плавного пользовательского опыта

Цветовая схема по вкладкам (красный/зеленый/синий/фиолетовый)

Индикаторы состояния в реальном времени

Единый AppBar с отображением всех состояний

🎯 Цели обучения
Понимание различий между BLoC и Provider

Практика работы с go_router

Реализация сложной навигации

Управление множеством независимых состояний

Создание пользовательских обработчиков навигации


