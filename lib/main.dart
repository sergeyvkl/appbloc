// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'features/counter/bloc/counter_bloc.dart';
import 'features/counter2/bloc/counter2_bloc.dart';
import 'features/router/app_router.dart';
import 'features/triangle/bloc/triangle_bloc.dart';
import 'features/triangle/provider/triangle_provider.dart';
import 'features/navigation/bloc/navigation_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TriangleProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationBloc()),
          BlocProvider(create: (context) => CounterBloc()),
          BlocProvider(create: (context) => Counter2Bloc()),
          BlocProvider(create: (context) => TriangleBloc()),
        ],
        child: MaterialApp.router(
          title: 'Flutter Bottom Navigation + GoRouter',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          routerConfig: AppRouter.instance.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}