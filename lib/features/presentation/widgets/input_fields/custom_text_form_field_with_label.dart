import 'package:flutter/material.dart';
import 'package:sabzi_bill/utils/const/app_extension.dart';

class CustomTextFormFieldWithLabel extends StatelessWidget {
  final Icon? prefixIcon;
  final String? hintText;
  final String label;
  final int maxLines;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const CustomTextFormFieldWithLabel({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.maxLines = 1,
    required this.label,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.validator,
    this.keyboardType
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
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            controller: controller,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            maxLines: maxLines,
            style: context.textTheme.bodySmall,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            validator: validator,
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
