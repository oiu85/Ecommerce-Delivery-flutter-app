import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/controller/items/edit_controller.dart';
import 'package:p_admin/core/class/handlingdataview.dart';
import 'package:p_admin/core/constant/color.dart';
import 'package:p_admin/core/functions/validinput.dart';
import 'package:p_admin/core/shared/customtextformglobal.dart';
import 'package:p_admin/view/widget/auth/custombuttomauth.dart';
import '../../../core/shared/customdrpdownsearch.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsEditController controller = Get.put(ItemsEditController());

    final titleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: AppColor.primaryColor,
    );

    return Scaffold(
      appBar: AppBar(
        title:  Text("227".tr, style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<ItemsEditController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  Text("228".tr, style: titleStyle),
                  const SizedBox(height: 20),

                  // الاسم
                  CustomTextFormGlobal(
                    hintText: "229".tr,
                    labelText: "230".tr,
                    iconDate: Icons.text_fields,
                    mycontroller: controller.name,
                    valid: (val) => validInput(val!, 1, 200, ""),
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "231".tr,
                    labelText: "232".tr,
                    iconDate: Icons.text_fields,
                    mycontroller: controller.namear,
                    valid: (val) => validInput(val!, 1, 200, ""),
                    isNumber: false,
                  ),

                  // وصف انجليزي
                  Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("233".tr, style: titleStyle),
                          IconButton(
                            icon: Icon(
                              controller.isDescExpanded.value
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              color: AppColor.primaryColor,
                            ),
                            onPressed: () {
                              controller.isDescExpanded.toggle();
                            },
                          ),
                        ],
                      ),
                      if (controller.isDescExpanded.value)
                        TextFormField(
                          controller: controller.desc,
                          validator: (val) =>
                              validInput(val!, 1, 30000, ""),
                          decoration:  InputDecoration(
                            labelText: "234".tr,
                            hintText:
                            "235".tr,
                            prefixIcon: Icon(Icons.description),
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                          ),
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: null,
                        ),
                    ],
                  )),

                  const SizedBox(height: 15),

                  // وصف عربي
                  Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("236".tr, style: titleStyle),
                          IconButton(
                            icon: Icon(
                              controller.isDescArExpanded.value
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              color: AppColor.primaryColor,
                            ),
                            onPressed: () {
                              controller.isDescArExpanded.toggle();
                            },
                          ),
                        ],
                      ),
                      if (controller.isDescArExpanded.value)
                        TextFormField(
                          controller: controller.descar,
                          validator: (val) =>
                              validInput(val!, 1, 30000, ""),
                          decoration:  InputDecoration(
                            labelText: "237".tr,
                            hintText: "238".tr,
                            prefixIcon: Icon(Icons.description),
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                          ),
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: null,
                        ),
                    ],
                  )),

                  const SizedBox(height: 20),

                  // الحقول الأخرى
                  CustomTextFormGlobal(
                    hintText: "239".tr,
                    labelText: "240".tr,
                    iconDate: Icons.format_list_numbered,
                    mycontroller: controller.count,
                    valid: (val) => validInput(val!, 1, 200, ""),
                    isNumber: true,
                  ),
                  CustomTextFormGlobal(
                    hintText: "241".tr,
                    labelText: "242".tr,
                    iconDate: Icons.attach_money,
                    mycontroller: controller.price,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: true,
                  ),
                  CustomTextFormGlobal(
                    hintText: "234".tr,
                    labelText: "244".tr,
                    iconDate: Icons.science,
                    mycontroller: controller.scientificformula,
                    valid: (val) => validInput(val!, 1, 10000, ""),
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "245".tr,
                    labelText: "246".tr,
                    iconDate: Icons.science_outlined,
                    mycontroller: controller.scientificformula_ar,
                    valid: (val) => validInput(val!, 1, 10000, ""),
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "247".tr,
                    labelText: "248".tr,
                    iconDate: Icons.discount,
                    mycontroller: controller.discount,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: true,
                  ),
                  CustomTextFormGlobal(
                    hintText: "249".tr,
                    labelText: "250".tr,
                    iconDate: Icons.medication_liquid,
                    mycontroller: controller.prescription,
                    valid: (val) => validInput(val!, 1, 60, ""),
                    isNumber: true,
                  ),

                  const SizedBox(height: 15),
                  CustomDropDownSearch(
                    title: "251".tr,
                    listdata: controller.dropdownlist,
                    dropdownSelectedName: controller.catname!,
                    dropdownSelectedID: controller.catid,
                  ),

                  const SizedBox(height: 20),
                  Text("252".tr, style: titleStyle),
                  RadioListTile(
                    title:  Text("253".tr),
                    value: "0",
                    groupValue: controller.active,
                    onChanged: (val) => controller.changeStatusActive(val),
                  ),
                  RadioListTile(
                    title:  Text("254".tr),
                    value: "1",
                    groupValue: controller.active,
                    onChanged: (val) => controller.changeStatusActive(val),
                  ),

                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.thirdColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      onPressed: () => controller.showOptionImage(),
                      icon: const Icon(Icons.image, color: Colors.black),
                      label:  Text("255".tr,
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),

                  if (controller.file != null)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: AppColor.primaryColor, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.file(controller.file!,
                          width: 200, fit: BoxFit.cover),
                    ),

                  const SizedBox(height: 20),
                  CustomButtomAuth(
                    text: "256".tr,
                    onPressed: () => controller.editData(),
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
