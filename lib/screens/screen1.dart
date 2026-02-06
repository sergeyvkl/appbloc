// Экран 1 с счетчиком и треугольником
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/counter/bloc/counter_bloc.dart';
import '../features/navigation/bloc/navigation_bloc.dart';
import '../features/navigation/tab_item.dart';
import '../features/triangle/bloc/triangle_bloc.dart';
import '../features/triangle/widgets/triangle_bloc_widget.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.home, size: 60, color: Colors.red),
              const SizedBox(height: 10),
              Text(
                'Screen 1',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              const Text('Первый счетчик + Треугольник'),
              const SizedBox(height: 30),
              
              // Разделитель
              Container(
                height: 1,
                width: 300,
                color: Colors.red[200],
                margin: const EdgeInsets.symmetric(vertical: 20),
              ),
              
              // Секция треугольника
              const Text(
                'Интерактивный треугольник',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Нажмите на треугольник для поворота и смены цвета',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              
              // Треугольник с анимацией
              BlocBuilder<TriangleBloc, TriangleState>(
                builder: (context, triangleState) {
                  return Column(
                    children: [
                      TriangleBlocWidget(
                        color: triangleState.color,
                        angle: triangleState.angle.toDouble(),
                        onTap: () {
                          context.read<TriangleBloc>().add(ToggleTriangle());
                        },
                      ),
                      const SizedBox(height: 30),
                      
                      // Информация о треугольнике
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: triangleState.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: triangleState.color),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Угол поворота:'),
                                Text(
                                  '${triangleState.angle}°',
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
                                        color: triangleState.color,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      triangleState.color == Colors.red ? 'Красный' : 'Зеленый',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: triangleState.color,
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
                                  '${triangleState.clickCount}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            LinearProgressIndicator(
                              value: (triangleState.angle % 360) / 360,
                              backgroundColor: Colors.grey[200],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                triangleState.color,
                              ),
                              minHeight: 10,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Прогресс вращения: ${(triangleState.angle % 360)}° / 360°',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Кнопки управления треугольником
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context.read<TriangleBloc>().add(ToggleTriangle());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: triangleState.color,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                            ),
                            child: const Text('Повернуть треугольник'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              context.read<TriangleBloc>().add(ResetTriangle());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                            ),
                            child: const Text('Сбросить'),
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
                color: Colors.red[200],
                margin: const EdgeInsets.symmetric(vertical: 20),
              ),
              
              // Секция счетчика
              const Text(
                'Первый счетчик (Counter 1)',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 30),
              
              // Отображение первого счетчика
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, counterState) {
                  return Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.red, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '${counterState.count}',
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Этот счетчик независим от треугольника',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              
              // Кнопки управления первым счетчиком
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: 'decrement1',
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementCounter());
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 20),
                  
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(ResetCounter());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                    ),
                    child: const Text(
                      'Сброс',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 20),
                  
                  FloatingActionButton(
                    heroTag: 'increment1',
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounter());
                    },
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Информация о текущих состояниях
              BlocBuilder<TriangleBloc, TriangleState>(
                builder: (context, triangleState) {
                  return BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, counterState) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.red),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Текущие состояния:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Счетчик:'),
                                Text(
                                  '${counterState.count}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Угол треугольника:'),
                                Text(
                                  '${triangleState.angle}°',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Цвет треугольника:'),
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: triangleState.color,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Клики по треугольнику:'),
                                Text(
                                  '${triangleState.clickCount}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              
              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Быстрая навигация',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<NavigationBloc>().add(TabChanged(TabItem.screen2));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.arrow_right, size: 30,),
                          label: const Text('К экрану 2'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}