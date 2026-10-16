import 'package:flutter/material.dart';
import 'package:sabzi_bill/features/presentation/widgets/get_letter_from_text.dart';
import 'package:sabzi_bill/features/presentation/widgets/get_random_color.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';
import 'package:sabzi_bill/utils/const/app_extension.dart';

class CircleAvatarWithNameLetter extends StatelessWidget {
  final double radius;
  final String name;
  const CircleAvatarWithNameLetter({super.key, this.radius = 32,required this.name});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: getRandomColor(name),
      radius: radius,
      child: Text(
        getLetterFromText(name),
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColor.surface,
        ),
      ),
    );
  }
}