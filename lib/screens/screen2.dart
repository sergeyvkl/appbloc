// Экран 2 со вторым независимым счетчиком
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/counter/bloc/counter_bloc.dart';
import '../features/counter2/bloc/counter2_bloc.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.search, size: 100, color: Colors.green),
              const SizedBox(height: 20),
              Text(
                'Screen 2',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              const Text('Второй счетчик (Counter 2)'),
              const SizedBox(height: 10),
              Text(
                'Не зависит от первого счетчика',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              
              // Отображение второго счетчика
              BlocBuilder<Counter2Bloc, Counter2State>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Text(
                        '${state.count}',
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Сравнение счетчиков:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BlocBuilder<CounterBloc, CounterState>(
                                  builder: (context, counter1State) {
                                    return Text(
                                      'Counter 1: ${counter1State.count}',
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  'Counter 2: ${state.count}',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            BlocBuilder<CounterBloc, CounterState>(
                              builder: (context, counter1State) {
                                final difference = state.count - counter1State.count;
                                return Text(
                                  'Разница: ${difference > 0 ? '+' : ''}$difference',
                                  style: TextStyle(
                                    color: difference > 0 ? Colors.green : 
                                           difference < 0 ? Colors.red : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
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
              const SizedBox(height: 30),
              
              // Кнопки управления вторым счетчиком
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  // Кнопка -10
                  ElevatedButton(
                    onPressed: () {
                      context.read<Counter2Bloc>().add(DecrementCounter2());
                      context.read<Counter2Bloc>().add(DecrementCounter2());
                      context.read<Counter2Bloc>().add(DecrementCounter2());
                      context.read<Counter2Bloc>().add(DecrementCounter2());
                      context.read<Counter2Bloc>().add(DecrementCounter2());
                      context.read<Counter2Bloc>().add(DecrementCounter2());
                      context.read<Counter2Bloc>().add(DecrementCounter2());
                      context.read<Counter2Bloc>().add(DecrementCounter2());
                      context.read<Counter2Bloc>().add(DecrementCounter2());
                      context.read<Counter2Bloc>().add(DecrementCounter2());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700],
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text('-10'),
                  ),
                  
                  // Кнопка -5
                  ElevatedButton(
                    onPressed: () {
                      for (int i = 0; i < 5; i++) {
                        context.read<Counter2Bloc>().add(DecrementCounter2());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text('-5'),
                  ),
                  
                  // Кнопка -1
                  ElevatedButton(
                    onPressed: () {
                      context.read<Counter2Bloc>().add(DecrementCounter2());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[300],
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text('-1'),
                  ),
                  
                  // Кнопка сброса
                  ElevatedButton(
                    onPressed: () {
                      context.read<Counter2Bloc>().add(ResetCounter2());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                    ),
                    child: const Text('СБРОС'),
                  ),
                  
                  // Кнопка +1
                  ElevatedButton(
                    onPressed: () {
                      context.read<Counter2Bloc>().add(IncrementCounter2());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[300],
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text('+1'),
                  ),
                  
                  // Кнопка +5
                  ElevatedButton(
                    onPressed: () {
                      for (int i = 0; i < 5; i++) {
                        context.read<Counter2Bloc>().add(IncrementCounter2());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text('+5'),
                  ),
                  
                  // Кнопка +10
                  ElevatedButton(
                    onPressed: () {
                      for (int i = 0; i < 10; i++) {
                        context.read<Counter2Bloc>().add(IncrementCounter2());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text('+10'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Установка произвольного значения
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Установить произвольное значение:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<Counter2Bloc>().add(SetValueCounter2(-100));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('-100'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            context.read<Counter2Bloc>().add(SetValueCounter2(100));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('+100'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            context.read<Counter2Bloc>().add(SetValueCounter2(999));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                          ),
                          child: const Text('999'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              // Информация
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.info, color: Colors.green, size: 32),
                    SizedBox(height: 10),
                    Text(
                      'Этот счетчик (Counter 2) полностью независим от Counter 1 на первом экране.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Они управляются разными Bloc и имеют разные состояния.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}