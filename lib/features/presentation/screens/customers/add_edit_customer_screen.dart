import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sabzi_bill/features/model/customer/customer.dart';
import 'package:sabzi_bill/features/presentation/providers/customer_provider.dart';
import 'package:sabzi_bill/features/presentation/widgets/buttons/icon_with_text_button.dart';
import 'package:sabzi_bill/features/presentation/widgets/input_fields/custom_text_form_field_with_label.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';

class AddEditCustomerScreen extends StatefulWidget {
  final bool isEditFlag;
  final Customer? customer;
  const AddEditCustomerScreen({
    super.key,
    this.isEditFlag = false,
    this.customer,
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
    customerNameController.text = widget.customer?.name ?? "";
    customerPhoneController.text = widget.customer?.phone ?? "";
    customerAddressController.text = widget.customer?.address ?? "";
  }

  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerPhoneController = TextEditingController();
  final TextEditingController customerAddressController =
      TextEditingController();

  final FocusNode customerNameFocusNode = FocusNode();
  final FocusNode customerPhoneFocusNode = FocusNode();
  final FocusNode customerAddressFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  Future<void> clickOnSaveButton() async {
    if (_formKey.currentState!.validate()) {
      int result = 0;
      if (widget.isEditFlag) {
        Customer customer = widget.customer!;
        customer.name = customerNameController.text.trim();
        customer.phone = customerPhoneController.text.trim();
        customer.address = customerAddressController.text.trim();
        result = await context.read<CustomerProvider>().updateCustomer(
          customer,
        );
        if (result != 0) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Update Successfully")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Update Unsuccessfully")),
          );
        }

        if (context.canPop()) {
          context.pop();
        }
      } else {
        Customer customer = Customer.fromJson({
          "name": customerNameController.text.trim(),
          "phone": customerPhoneController.text.trim(),
          "address": customerAddressController.text.trim(),
        });
        context.read<CustomerProvider>().createCustomer(customer);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Created Successfully")),
        );
        if (context.canPop()) {
          context.pop();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.isEditFlag ? "Edit" : "Add"} Customer"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  keyboardType: TextInputType.name,
                  label: "Customer Name *",
                  hintText: "Enter customer name",
                  validator: (p0) {
                    if (customerNameController.text.trim().isEmpty) {
                      return "Please enter the customer name.";
                    }
                    return null;
                  },
                  onFieldSubmitted: (p0) =>
                      FocusScope.of(context)
                          .requestFocus(customerPhoneFocusNode),
                ),
                const SizedBox(height: 16),
                CustomTextFormFieldWithLabel(
                  controller: customerPhoneController,
                  focusNode: customerPhoneFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  label: "Phone Number (Optional)",
                  hintText: "Enter phone number",
                  validator: (p0) {
                    if (p0 == null || p0.trim().isEmpty) {
                      return null;
                    } else if (p0.trim().length != 10) {
                      return "Please enter 10 digit phone number";
                    }
                    return null;
                  },
                  onFieldSubmitted: (p0) =>
                      FocusScope.of(context)
                          .requestFocus(customerAddressFocusNode),
                ),
                const SizedBox(height: 16),
                CustomTextFormFieldWithLabel(
                  controller: customerAddressController,
                  focusNode: customerAddressFocusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
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
                  onTap: clickOnSaveButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
