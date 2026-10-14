import 'package:flutter/material.dart';
import 'package:sabzi_bill/utils/const/app_extension.dart';

class CustomTextFormField extends StatelessWidget {
  final Icon? prefixIcon;
  final String? hintText;
  const CustomTextFormField({super.key,this.prefixIcon, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        style: context.textTheme.bodySmall,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
        ),
      ),
    );
  }
}
