// Экран 3 - обновим для отображения треугольника
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/counter/bloc/counter_bloc.dart';
import '../features/counter2/bloc/counter2_bloc.dart';
import '../features/triangle/bloc/triangle_bloc.dart';
import '../features/triangle/widgets/triangle_bloc_widget.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite, size: 100, color: Colors.blue),
              const SizedBox(height: 20),
              Text(
                'Screen 3',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              const Text('Монитор всех состояний'),
              const SizedBox(height: 30),
              
              // Показать все состояния
              BlocBuilder<TriangleBloc, TriangleState>(
                builder: (context, triangleState) {
                  return BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, counter1State) {
                      return BlocBuilder<Counter2Bloc, Counter2State>(
                        builder: (context, counter2State) {
                          return Column(
                            children: [
                              // Треугольник
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: triangleState.color),
                                  boxShadow: [
                                    BoxShadow(
                                      color: triangleState.color.withValues(alpha: 0.2),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Треугольник из Screen1',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    CustomPaint(
                                      size: const Size(100, 100),
                                      painter: TrianglePainter(color: triangleState.color),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      'Угол: ${triangleState.angle}°',
                                      style: TextStyle(
                                        color: triangleState.color,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Кликов: ${triangleState.clickCount}',
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              
                              // Счетчики
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Counter 1
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.red[50],
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.red),
                                    ),
                                    child: Column(
                                      children: [
                                        const Icon(Icons.countertops, color: Colors.red, size: 40),
                                        const SizedBox(height: 10),
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
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Counter 2
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.green[50],
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.green),
                                    ),
                                    child: Column(
                                      children: [
                                        const Icon(Icons.countertops, color: Colors.green, size: 40),
                                        const SizedBox(height: 10),
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
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              
                              // Статистика
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.blue),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Общая статистика',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Сумма всех счетчиков:'),
                                        Text(
                                          '${counter1State.count + counter2State.count}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Всего кликов по треугольнику:'),
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Общий угол поворота:'),
                                        Text(
                                          '${triangleState.angle}°',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),

              // Кнопка перехода на DetailsScreen через GoRouter
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.deepOrange, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrange.withValues(alpha: 0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Icon(Icons.router, size: 40, color: Colors.deepOrange),
                    const SizedBox(height: 0),
                    const Text(
                      'Навигация через GoRouter',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Нажмите кнопку для перехода на DetailsScreen:',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    
                    // Основная кнопка перехода
                    ElevatedButton.icon(
                      onPressed: () {
                        // Переход на DetailsScreen через GoRouter
                        context.go('/details');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.open_in_new),
                      label: const Text(
                        'Открыть DetailsScreen',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                    // Альтернативные способы
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => context.push('/details'), 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('pop()', style: TextStyle(color: Colors.white),),
                        ),
                        ElevatedButton(
                          onPressed: () => context.goNamed('details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                          ),
                          child: const Text('goNamed()', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
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
}