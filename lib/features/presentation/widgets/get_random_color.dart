import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';

Color getRandomColor(String text) {
  Color primaryColor = AppColor.primaryColor;
  final hash = text.toLowerCase().trim().hashCode;
  final random = Random(hash);

  // Generate a color variation around the primary color
  int vary(int value) {
    final offset = random.nextInt(101) - 50; // -50 to +50
    return (value + offset).clamp(0, 255);
  }

  return Color.fromARGB(
    255,
    vary(primaryColor.red),
    vary(primaryColor.green),
    vary(primaryColor.blue),
  );
}
