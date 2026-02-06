import 'package:flutter/material.dart';

import 'router_main.dart';

/// The main app.
class RouterApp extends StatelessWidget {
  /// Constructs a [RouterApp]
  const RouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: routerMain);
  }
}