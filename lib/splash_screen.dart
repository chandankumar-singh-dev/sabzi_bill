import 'package:flutter/material.dart';
import 'package:sabzi_bill/utils/const/app_assets_string.dart';
import 'package:sabzi_bill/utils/const/app_extension.dart';
import 'package:sabzi_bill/utils/const/app_text.dart';

class SplashScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8F3),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 90, child: Image.asset(AssetsPathString.appLogo)),
            Text(
              AppText.appName,
              style: context.textTheme.displayLarge,
            ),
            Text(
              AppText.appTagLine,
              style: context.textTheme.displaySmall,
            ),
            const SizedBox(height: 40),
            Image.asset(AssetsPathString.freshVegatable),
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
