import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sabzi_bill/features/presentation/widgets/buttons/icon_with_text_button.dart';
import 'package:sabzi_bill/features/presentation/widgets/circle_avatar_with_name.dart';
import 'package:sabzi_bill/features/presentation/widgets/input_fields/custom_text_form_field.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';
import 'package:sabzi_bill/utils/const/app_extension.dart';

class CustomersListScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: "Search customer",
                    prefixIcon: Icon(CupertinoIcons.search),
                  ),
                  const SizedBox(height: 16),
                  IconWithTextButton(
                    onTap: () => context.push("/add_edit_customer_screen"),
                    label: "Add Customer",
                    icon: Icon(CupertinoIcons.add, color: AppColor.surface),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: () => context.push("/customer-details"),
                    minTileHeight: 85,
                    leading: CircleAvatarWithNameLetter(name: "Ramesh patel",),
                    title: Text(
                      "Ramesh Patel",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    horizontalTitleGap: 10,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "5 Bills",
                          style: context.textTheme.labelSmall?.copyWith(
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(CupertinoIcons.right_chevron, size: 14),
                      ],
                    ),
                    subtitle: Text(
                      "Ramesh Patel",
                      style: context.textTheme.labelSmall?.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    tileColor: AppColor.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: AppColor.inputFieldBorder),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
