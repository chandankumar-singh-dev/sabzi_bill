import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sabzi_bill/features/presentation/providers/customer_provider.dart';
import 'package:sabzi_bill/features/presentation/widgets/buttons/icon_with_text_button.dart';
import 'package:sabzi_bill/features/presentation/widgets/circle_avatar_with_name.dart';
import 'package:sabzi_bill/features/presentation/widgets/input_fields/custom_text_form_field.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';
import 'package:sabzi_bill/utils/const/app_extension.dart';
import 'package:sabzi_bill/utils/log/dev_logger.dart';

class CustomersListScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CustomersListScreen> createState() => _CustomersListScreenState();
}

class _CustomersListScreenState extends State<CustomersListScreen> {
  @override
  void initState() {
    loadCustomer();
    super.initState();
  }

  void loadCustomer() async {
    await context.read<CustomerProvider>().loadCustomerList();
  }

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
              child: Consumer<CustomerProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: provider.customers.length,
                    itemBuilder: (context, index) {
                      devLog("${provider.customers[index].phone}", "TEST");
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          onTap: () => context.push(
                            "/customer-details",
                            extra: {"customer": provider.customers[index]},
                          ),
                          minTileHeight: 85,
                          leading: CircleAvatarWithNameLetter(
                            name: provider.customers[index].name,
                          ),
                          title: Text(
                            provider.customers[index].name,
                            style: context.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          horizontalTitleGap: 10,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${provider.customers[index].id} Bills",
                                style: context.textTheme.labelSmall?.copyWith(
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(CupertinoIcons.right_chevron, size: 14),
                            ],
                          ),
                          subtitle:
                              (provider.customers[index].phone != null &&
                                  provider.customers[index].phone
                                      .toString()
                                      .isNotEmpty)
                              ? Text(
                                  provider.customers[index].phone ?? "",
                                  style: context.textTheme.labelSmall?.copyWith(
                                    fontSize: 13,
                                  ),
                                )
                            : null,
                          tileColor: AppColor.surface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: AppColor.inputFieldBorder),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
