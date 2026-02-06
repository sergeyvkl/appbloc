import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The details screen
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        // Можно добавить условие для блокировки возврата
        // canPop: _canPop(),
        onPopInvokedWithResult: (didPop, result) async {
          log('🔄 Попытка возврата. didPop: $didPop');
          if (didPop) {
            // Выполняем кастомную логику перед возвратом
            //_onBackButtonPressed(context);
            log('✅ Возврат выполнен системой');
            // После логики можно вызвать pop
            //if (context.canPop()) {
            //  context.pop();
            //}
          }
        },
        child: Scaffold(
        appBar: AppBar(
          title: const Text('Details Screen'),
          //leading: IconButton(
          //  icon: const Icon(Icons.arrow_back_ios),
          //  onPressed: () {
              // Кастомная обработка кнопки Back в AppBar
          //   log('✅ Кастомная обработка кнопки Back в AppBar');
          // },
          //),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => context.pop(),//context.go('/'),
            child: const Text('Go back to the Home screen'),
          ),
        ),
      ),
    );
  }
}