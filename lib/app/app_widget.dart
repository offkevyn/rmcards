import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/util/app/colors_app.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RMCards',
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        primaryColor: ColorsApp.green,
        scaffoldBackgroundColor: ColorsApp.black2,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: ColorsApp.white,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            color: ColorsApp.white,
            fontSize: 14,
          ),
          bodySmall: TextStyle(
            color: ColorsApp.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
