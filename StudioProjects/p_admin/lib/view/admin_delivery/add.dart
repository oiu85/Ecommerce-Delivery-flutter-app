import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/controller/admin_deilvery/add_controller.dart';
import 'package:p_admin/core/class/handlingdataview.dart';
import 'package:p_admin/core/constant/color.dart';
import 'package:p_admin/core/functions/validinput.dart';
import 'package:p_admin/view/widget/auth/custombuttomauth.dart';

class DeilveryAdd extends StatelessWidget {
  const DeilveryAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddDeilveryController controller = Get.put(AddDeilveryController());

    return Scaffold(
      appBar: AppBar(
        title:  Text("267".tr),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: GetBuilder<AddDeilveryController>(
        builder: (_) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Form(
                    key: controller.formState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                         Text(
                          "268".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 30),

                        DeliveryInputField(
                          label: "269".tr,
                          hint: "270".tr,
                          icon: Icons.person_outline,
                          controller: controller.name,
                          validator: (val) => validInput(val!, 1, 60, ""),
                        ),

                        DeliveryInputField(
                          label: "271".tr,
                          hint: "272".tr,
                          icon: Icons.phone_android_outlined,
                          isNumber: true,
                          controller: controller.phone,
                          validator: (val) => validInput(val!, 1, 60, ""),
                        ),

                        DeliveryInputField(
                          label: "273".tr,
                          hint: "274".tr,
                          icon: Icons.email_outlined,
                          controller: controller.email,
                          validator: (val) => validInput(val!, 1, 60, ""),
                        ),

                        DeliveryInputField(
                          label: "275".tr,
                          hint: "276".tr,
                          icon: Icons.lock_outline,
                          obscureText: true,
                          controller: controller.password,
                          validator: (val) => validInput(val!, 1, 60, ""),
                        ),

                        const SizedBox(height: 30),
                        CustomButtomAuth(
                          text: "277".tr,
                          onPressed: () {
                            controller.addData();
                          },
                        ),
                      ],
                    ),
                  ),
                ),

            ),
          ),
        ),
      ),
    );
  }
}

// ويدجت إدخال محسّن
class DeliveryInputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isNumber;
  final bool obscureText;

  const DeliveryInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.validator,
    this.isNumber = false,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: AppColor.primaryColor,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColor.primaryColor, width: 1.5),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
