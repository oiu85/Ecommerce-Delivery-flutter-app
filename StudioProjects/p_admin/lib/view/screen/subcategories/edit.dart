
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/core/class/handlingdataview.dart';
import 'package:p_admin/core/constant/color.dart';
import 'package:p_admin/core/functions/validinput.dart';
import 'package:p_admin/core/shared/customtextformglobal.dart';
import 'package:p_admin/view/widget/auth/custombuttomauth.dart';

import '../../../controller/subcategories/edit_controller.dart';

class SubCategoriesEdit extends StatelessWidget {
  const SubCategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    SubCategoriesEditController controller = Get.put(SubCategoriesEditController());
    return Scaffold(
        appBar: AppBar(
          title: Text("367".tr),
        ),
        body: GetBuilder<SubCategoriesEditController>(
            builder: (controller)=> HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      Text("${"375".tr}: " ,
                        style: TextStyle(
                            fontSize: 20 ,
                            fontWeight: FontWeight.bold ,
                            color: AppColor.primaryColor),
                      ),
                      SizedBox(height: 30,),
                      CustomTextFormGlobal(
                        hintText: "368".tr,
                        labelText: "369".tr,
                        iconDate: Icons.category,
                        mycontroller: controller.name,
                        valid: (val){
                          return validInput(val!, 1, 60, "");
                        },
                        isNumber: false,
                      ),

                      CustomTextFormGlobal(
                        hintText: "370".tr,
                        labelText: "371".tr,
                        iconDate: Icons.category,
                        mycontroller: controller.namear,
                        valid: (val){
                          return validInput(val!, 1, 60, "");
                        },
                        isNumber: false,
                      ),
                      Text("${"372".tr}: " ,
                        style: TextStyle(
                            fontSize: 20 ,
                            fontWeight: FontWeight.bold ,
                            color: AppColor.primaryColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              onPressed: (){
                                controller.chooseImage();
                              },
                              color: AppColor.thirdColor,
                              textColor: AppColor.secondColor,
                              child:   Text("373".tr,style: TextStyle(color: Colors.black),),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              onPressed: (){
                                controller.takeImage();
                              },
                              color: AppColor.thirdColor,
                              textColor: AppColor.secondColor,
                              child:  Text("374".tr,style: TextStyle(color: Colors.black),),
                            ),
                          ),
                        ],
                      ),
                      if(controller.file !=null)
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.primaryColor,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.file(controller.file!,width: 200,fit: BoxFit.cover,),
                        ),
                      CustomButtomAuth(
                        text: "Save" ,
                        onPressed: (){
                          controller.editData();
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}
