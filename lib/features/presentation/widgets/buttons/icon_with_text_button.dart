import 'package:flutter/cupertino.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';
import 'package:sabzi_bill/utils/const/app_extension.dart';

class IconWithTextButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final void Function()? onTap;
  const IconWithTextButton({super.key,required this.label,required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColor.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
