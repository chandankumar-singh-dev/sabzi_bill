import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabzi_bill/features/presentation/widgets/buttons/icon_with_text_button.dart';
import 'package:sabzi_bill/features/presentation/widgets/input_fields/custom_text_form_field_with_label.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';

class AddEditCustomerScreen extends StatefulWidget {
  final bool isEditFlag;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  const AddEditCustomerScreen({
    super.key,
    this.isEditFlag = false,
    this.customerAddress,
    this.customerName,
    this.customerPhone,
  });

  @override
  State<AddEditCustomerScreen> createState() => _AddEditCustomerScreenState();
}

class _AddEditCustomerScreenState extends State<AddEditCustomerScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.isEditFlag) {
      initializationTextEditingController();
    }
  }

  @override
  void dispose() {
    customerNameController.dispose();
    customerPhoneController.dispose();
    customerAddressController.dispose();

    customerNameFocusNode.dispose();
    customerPhoneFocusNode.dispose();
    customerAddressFocusNode.dispose();
    super.dispose();
  }

  void initializationTextEditingController() {
    customerNameController.text = widget.customerName ?? "";
    customerPhoneController.text = widget.customerPhone ?? "";
    customerAddressController.text = widget.customerAddress ?? "";
  }

  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerPhoneController = TextEditingController();
  final TextEditingController customerAddressController =
      TextEditingController();

  final FocusNode customerNameFocusNode = FocusNode();
  final FocusNode customerPhoneFocusNode = FocusNode();
  final FocusNode customerAddressFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.isEditFlag ? "Edit" : "Add"} Customer"),
      ),
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
                controller: customerNameController,
                focusNode: customerNameFocusNode,
                textInputAction: TextInputAction.next,
                label: "Customer Name *",
                hintText: "Enter customer name",
                onFieldSubmitted: (p0) =>
                    FocusScope.of(context).requestFocus(customerPhoneFocusNode),
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldWithLabel(
                controller: customerPhoneController,
                focusNode: customerPhoneFocusNode,
                textInputAction: TextInputAction.next,
                label: "Phone Number (Optional)",
                hintText: "Enter phone number",
                onFieldSubmitted: (p0) =>
                    FocusScope.of(context)
                        .requestFocus(customerAddressFocusNode),
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldWithLabel(
                controller: customerAddressController,
                focusNode: customerAddressFocusNode,
                textInputAction: TextInputAction.done,
                label: "Address (Optional)",
                hintText: "Enter address",
                maxLines: 5,
                onFieldSubmitted: (p0) => FocusScope.of(context).unfocus(),
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
