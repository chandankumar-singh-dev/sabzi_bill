import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sabzi_bill/features/presentation/widgets/buttons/icon_with_text_button.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';
import 'package:sabzi_bill/utils/const/app_extension.dart';

class CreateFirstCustomerScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Customers", style: context.textTheme.displayMedium),
                    Text(
                      "Manage your regular customers",
                      style: context.textTheme.labelSmall?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.primaryColor.withValues(alpha: 0.2),
                  ),
                  child: Icon(
                    CupertinoIcons.person_2_alt,
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(),
            const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/svgs/empty_customers.svg"),
                Text(
                  "No customers yet",
                  style: context.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Add your first customer to start creating bills and keeping track of payments",
                  style: context.textTheme.labelSmall?.copyWith(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                IconWithTextButton(
                  onTap: () => context.push('/add_edit_customer_screen'),
                  label: "Add your first customer",
                  icon: Icon(CupertinoIcons.add, color: AppColor.surface),
                ),
                const SizedBox(height: 10),
                Text(
                  "Your customer list will appear here.",
                  style: context.textTheme.labelSmall?.copyWith(fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
