import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabzi_bill/features/presentation/widgets/buttons/icon_with_text_button.dart';
import 'package:sabzi_bill/features/presentation/widgets/input_fields/custom_text_form_field_with_label.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';

class AddEditCustomerScreen extends StatelessWidget {
  const AddEditCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Customer")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColor.primaryColor.withValues(alpha: 0.1),
                child: Icon(
                  CupertinoIcons.camera_fill,
                  size: 40,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldWithLabel(
                label: "Customer Name *",
                hintText: "Enter customer name",
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldWithLabel(
                label: "Phone Number (Optional)",
                hintText: "Enter phone number",
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldWithLabel(
                label: "Address (Optional)",
                hintText: "Enter address",
                maxLines: 5,
              ),
              const SizedBox(height: 50),
              IconWithTextButton(
                icon: Icon(
                  CupertinoIcons.cloud_download_fill,
                  color: AppColor.surface,
                ),
                label: "Save Customer",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
