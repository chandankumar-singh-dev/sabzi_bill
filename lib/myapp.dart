import 'package:flutter/material.dart';
import 'package:sabzi_bill/route.dart';
import 'package:sabzi_bill/utils/const/app_theme.dart';

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: AppTheme.baseTheme(),
    );
  }
}
