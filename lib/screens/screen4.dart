// lib/screens.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../features/counter/bloc/counter_bloc.dart';
import '../features/counter2/bloc/counter2_bloc.dart';
import '../features/triangle/bloc/triangle_bloc.dart';
import '../features/triangle/provider/triangle_provider.dart';
import '../features/triangle/widgets/triangle_provider_widget.dart';

// Экран 4 с Provider треугольником
class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.person, size: 60, color: Colors.purple),
              const SizedBox(height: 10),
              Text(
                'Screen 4',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              const Text('Управление через Provider'),
              const SizedBox(height: 30),
              
              // Разделитель
              Container(
                height: 1,
                width: 300,
                color: Colors.purple[200],
                margin: const EdgeInsets.symmetric(vertical: 20),
              ),
              
              // Треугольник с Provider
              const Text(
                'Треугольник на Provider',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Управляется через Provider, а не Bloc',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              
              // Треугольник Provider
              Consumer<TriangleProvider>(
                builder: (context, triangleProvider, child) {
                  return Column(
                    children: [
                      TriangleProviderWidget(
                        color: triangleProvider.color,
                        angle: triangleProvider.angle.toDouble(),
                        onTap: () {
                          triangleProvider.toggle();
                        },
                        label: 'Provider Triangle',
                      ),
                      const SizedBox(height: 30),
                      
                      // Информация о треугольнике Provider
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: triangleProvider.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: triangleProvider.color),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Состояние Provider треугольника:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Угол поворота:'),
                                Text(
                                  '${triangleProvider.angle}°',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Цвет:'),
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: triangleProvider.color,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      triangleProvider.color == Colors.red ? 'Красный' : 'Зеленый',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: triangleProvider.color,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Количество кликов:'),
                                Text(
                                  '${triangleProvider.clickCount}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.purple,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            LinearProgressIndicator(
                              value: (triangleProvider.angle % 360) / 360,
                              backgroundColor: Colors.grey[200],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                triangleProvider.color,
                              ),
                              minHeight: 10,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Прогресс вращения: ${(triangleProvider.angle % 360)}° / 360°',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Кнопки управления Provider треугольником
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              triangleProvider.toggle();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: triangleProvider.color,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            child: const Text('Повернуть на 90°'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              triangleProvider.reset();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            child: const Text('Сбросить'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              triangleProvider.setAngle(45);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            child: const Text('Угол 45°'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              triangleProvider.setColor(Colors.blue);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            child: const Text('Синий'),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              
              // Разделитель
              Container(
                height: 1,
                width: 300,
                color: Colors.purple[200],
                margin: const EdgeInsets.symmetric(vertical: 20),
              ),
              
              // Треугольник Bloc для сравнения
              const Text(
                'Треугольник на Bloc (для сравнения)',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 30),
              
              BlocBuilder<TriangleBloc, TriangleState>(
                builder: (context, triangleState) {
                  return Column(
                    children: [
                      TriangleProviderWidget(
                        color: triangleState.color,
                        angle: triangleState.angle.toDouble(),
                        onTap: () {
                          context.read<TriangleBloc>().add(ToggleTriangle());
                        },
                        label: 'Bloc Triangle',
                      ),
                      const SizedBox(height: 20),
                      
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Сравнение подходов',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Consumer<TriangleProvider>(
                              builder: (context, provider, child) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Provider клики:'),
                                        Text(
                                          '${provider.clickCount}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Bloc клики:'),
                                        Text(
                                          '${triangleState.clickCount}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      provider.clickCount > triangleState.clickCount
                                          ? 'Provider кликов больше'
                                          : provider.clickCount < triangleState.clickCount
                                              ? 'Bloc кликов больше'
                                              : 'Кликов поровну',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              
              // Разделитель
              Container(
                height: 1,
                width: 300,
                color: Colors.purple[200],
                margin: const EdgeInsets.symmetric(vertical: 20),
              ),
              
              // Счетчики Bloc
              const Text(
                'Счетчики на Bloc',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 30),
              
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, counter1State) {
                  return BlocBuilder<Counter2Bloc, Counter2State>(
                    builder: (context, counter2State) {
                      return Column(
                        children: [
                          // Показать оба счетчика
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.red),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Counter 1',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '${counter1State.count}',
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Counter 2',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '${counter2State.count}',
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          
                          // Общая информация
                          Consumer<TriangleProvider>(
                            builder: (context, provider, child) {
                              return Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.purple[100],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Сводка по всем состояниям:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    _buildInfoRow('Сумма счетчиков:', 
                                        '${counter1State.count + counter2State.count}'),
                                    _buildInfoRow('Provider кликов:', 
                                        '${provider.clickCount}'),
                                    _buildInfoRow('Bloc кликов:', 
                                        '${context.read<TriangleBloc>().state.clickCount}'),
                                    _buildInfoRow('Provider угол:', 
                                        '${provider.angle}°'),
                                    _buildInfoRow('Bloc угол:', 
                                        '${context.read<TriangleBloc>().state.angle}°'),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Всего кликов: ${provider.clickCount + context.read<TriangleBloc>().state.clickCount}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          
                          // Кнопки управления всем
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.read<CounterBloc>().add(ResetCounter());
                                  context.read<Counter2Bloc>().add(ResetCounter2());
                                  context.read<TriangleBloc>().add(ResetTriangle());
                                  Provider.of<TriangleProvider>(context, listen: false).reset();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                ),
                                child: const Text('Сбросить ВСЁ'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<CounterBloc>().add(IncrementCounter());
                                  context.read<Counter2Bloc>().add(IncrementCounter2());
                                  context.read<TriangleBloc>().add(ToggleTriangle());
                                  Provider.of<TriangleProvider>(context, listen: false).toggle();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                ),
                                child: const Text('Инкремент всего'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              
              const SizedBox(height: 30),
              
              // Информация о технологиях
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.purple),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Icon(Icons.code, size: 40, color: Colors.purple),
                    SizedBox(height: 10),
                    Text(
                      'Используемые технологии:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('• Provider 6.1.5 - для треугольника на этом экране'),
                    Text('• Bloc 9.2.0 - для остальных состояний'),
                    Text('• ChangeNotifier - для реактивности Provider'),
                    Text('• Consumer - для подписок на изменения'),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}