import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/controller/items/add_controller.dart';
import 'package:p_admin/core/class/handlingdataview.dart';
import 'package:p_admin/core/constant/color.dart';
import 'package:p_admin/core/functions/validinput.dart';
import 'package:p_admin/core/shared/customtextformglobal.dart';
import 'package:p_admin/view/widget/auth/custombuttomauth.dart';
import '../../../core/shared/customdrpdownsearch.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsADDController controller = Get.put(ItemsADDController());

    final textStyleTitle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: AppColor.primaryColor,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة منتج", style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<ItemsADDController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  Text("معلومات المنتج", style: textStyleTitle),
                  const SizedBox(height: 20),

                  CustomTextFormGlobal(
                    hintText: "Enter Item Name",
                    labelText: "Name",
                    iconDate: Icons.text_fields,
                    mycontroller: controller.name,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "ادخل اسم المنتج بالعربية",
                    labelText: "الاسم",
                    iconDate: Icons.text_fields,
                    mycontroller: controller.namear,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "Enter Description",
                    labelText: "Description",
                    iconDate: Icons.description,
                    mycontroller: controller.desc,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "ادخل الوصف بالعربية",
                    labelText: "الوصف",
                    iconDate: Icons.description,
                    mycontroller: controller.descar,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "Enter Item Count",
                    labelText: "Count",
                    iconDate: Icons.format_list_numbered,
                    mycontroller: controller.count,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: true,
                  ),
                  CustomTextFormGlobal(
                    hintText: "Enter Item Price",
                    labelText: "Price",
                    iconDate: Icons.attach_money,
                    mycontroller: controller.price,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: true,
                  ),
                  CustomTextFormGlobal(
                    hintText: "Enter scientific formula",
                    labelText: "Scientific Formula",
                    iconDate: Icons.science,
                    mycontroller: controller.scientificformula,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "ادخل الصيغة العلمية",
                    labelText: "الصيغة",
                    iconDate: Icons.science_outlined,
                    mycontroller: controller.scientificformula_ar,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "Items Discount",
                    labelText: "Discount",
                    iconDate: Icons.discount,
                    mycontroller: controller.discount,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: true,
                  ),
                  CustomTextFormGlobal(
                    hintText: "هل المنتج يحتاج وصفة؟ (1 أو 0)",
                    labelText: "Prescription",
                    iconDate: Icons.medication_liquid,
                    mycontroller: controller.prescription,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: true,
                  ),

                  const SizedBox(height: 15),
                  CustomDropDownSearch(
                    title: "اختر التصنيف الفرعي",
                    listdata: controller.dropdownlist,
                    dropdownSelectedName: controller.catname!,
                    dropdownSelectedID: controller.catid,
                  ),
                  const SizedBox(height: 20),

                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.thirdColor,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: () => controller.showOptionImage(),
                      icon: const Icon(Icons.image, color: Colors.black),
                      label: const Text("اختيار صورة", style: TextStyle(color: Colors.black)),
                    ),
                  ),

                  const SizedBox(height: 10),
                  if (controller.file != null)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primaryColor, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.file(controller.file!, width: 200, fit: BoxFit.cover),
                    ),

                  const SizedBox(height: 20),
                  CustomButtomAuth(
                    text: "إضافة المنتج",
                    onPressed: () => controller.addData(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
