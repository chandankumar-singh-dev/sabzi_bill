import 'package:flutter/material.dart';
import 'package:sabzi_bill/utils/const/app_extension.dart';

class CustomTextFormFieldWithLabel extends StatelessWidget {
  final Icon? prefixIcon;
  final String? hintText;
  final String label;
  final int maxLines;
  const CustomTextFormFieldWithLabel({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.maxLines = 1,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.textTheme.bodySmall),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextFormField(
            maxLines: maxLines,
            style: context.textTheme.bodySmall,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
