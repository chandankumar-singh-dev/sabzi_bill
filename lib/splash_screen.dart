import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sabzi_bill/utils/const/app_assets_string.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';
import 'package:sabzi_bill/utils/const/app_extension.dart';
import 'package:sabzi_bill/utils/const/app_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 90, child: Image.asset(AssetsPathString.appLogo)),
            Text(AppText.appName, style: context.textTheme.displayLarge),
            Text(AppText.appTagLine, style: context.textTheme.displaySmall),
            const SizedBox(height: 40),
            Image.asset(AssetsPathString.freshVegatable, fit: BoxFit.contain),
            const SizedBox(height: 40),
            Text(
              AppText.appDetailsTagLine,
              textAlign: TextAlign.center,
              style: context.textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
