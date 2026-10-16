import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sabzi_bill/features/presentation/widgets/buttons/icon_with_text_button.dart';
import 'package:sabzi_bill/features/presentation/widgets/circle_avatar_with_name.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';
import 'package:sabzi_bill/utils/const/app_extension.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Customer Details")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                child: Row(
                  children: [
                    CircleAvatarWithNameLetter(
                      name: "Chandan kumar",
                      radius: 40,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chandan kumar",
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "898090090",
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () => context.push(
                        '/add_edit_customer_screen',
                        extra: {
                          "isEditFlag": true,
                          "customerName": "Chandankumar Singh",
                          "customerPhone": "43r23423423",
                          "customerAddress":
                              "kdjadisdfiw\njhdhau\ndhiahiuhasuih",
                        },
                      ),
                      icon: Icon(CupertinoIcons.pen),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: InfomationWidget(
                      lable: "Total Bills",
                      lableData: "12",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InfomationWidget(
                      lable: "Last Bill",
                      lableData: "12 Oct 2025",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Previous Bill",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColor.textSecondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: context.textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    height: 60,

                    decoration: BoxDecoration(
                      color: AppColor.surface,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(index == 0 ? 10 : 0),
                        topRight: Radius.circular(index == 0 ? 10 : 0),
                        bottomLeft: Radius.circular(index == 4 ? 10 : 0),
                        bottomRight: Radius.circular(index == 4 ? 10 : 0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.doc_text, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "10 Oct 2015",
                            style: context.textTheme.labelSmall,
                          ),
                        ),
                        Icon(
                          Icons.currency_rupee,
                          color: AppColor.textSecondary,
                          size: 20,
                        ),
                        Text("2015", style: context.textTheme.labelSmall),
                        const SizedBox(width: 8),
                        Icon(CupertinoIcons.right_chevron, size: 14),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: IconWithTextButton(
          label: "Create New Bill",
          icon: Icon(
            CupertinoIcons.doc_checkmark_fill,
            color: AppColor.surface,
          ),
        ),
      ),
    );
  }
}

class InfomationWidget extends StatelessWidget {
  final String lable;
  final String lableData;
  const InfomationWidget({
    super.key,
    required this.lable,
    required this.lableData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(lable, style: context.textTheme.labelSmall),
          Text(
            lableData,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
