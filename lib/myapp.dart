import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabzi_bill/config/databases/databases_helper_iml.dart';
import 'package:sabzi_bill/features/controller/customer/customer_repo_imp.dart';
import 'package:sabzi_bill/features/presentation/providers/customer_provider.dart';
import 'package:sabzi_bill/features/presentation/providers/home_screen_provider.dart';
import 'package:sabzi_bill/route.dart';
import 'package:sabzi_bill/utils/const/app_theme.dart';

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(
          create: (context) =>
              CustomerProvider(CustomerRepoImp(db: DatabasesHelperIml())),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter,
        theme: AppTheme.baseTheme(),
      ),
    );
  }
}
