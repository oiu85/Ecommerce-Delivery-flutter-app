import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:p_admin/core/class/handlingdataview.dart';
import 'package:p_admin/core/constant/color.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:p_admin/linkapi.dart';

import '../../../controller/subcategories/view_controller.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    SubCategoriesController controller = Get.put(SubCategoriesController());
    return Scaffold(
        appBar: AppBar(
          title: Text("364".tr),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
           Get.toNamed(AppRoute.subcategoriesadd);
          },
          child: Icon(Icons.add_outlined),
        ),
        body:  GetBuilder<SubCategoriesController>(
        builder: (controller) => HandlingDataView(
      statusRequest: controller.statusRequest,
      widget: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context ,index){
              return Card(
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: AppColor.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                          child: Text("${index+1}",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: AppColor.black,fontFamily: "Ciro"),),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: (){
                              controller.goToPageEdit(controller.data[index]);
                            },
                            child: CachedNetworkImage(
                                height: 80,
                                imageUrl: "${AppLink.imagesubcategories}/${controller.data[index].subcategoryImage!}"
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text("${controller.data[index].subcategoryName!}\n ${controller.data[index].subcategoryNameAr!}"),
                                subtitle: Text(Jiffy.parse("${controller.data[index].subcategoryDatetime}").format(pattern: 'MMMM do yyyy ')),
                                trailing: IconButton(
                                  onPressed: (){
                                    Get.defaultDialog(
                                        title: "365".tr,
                                        middleText: "366".tr,
                                        onCancel: (){},
                                        onConfirm: (){
                                          controller.deleteCategory(controller.data[index].subcategoryId!.toString(),
                                            controller.data[index].subcategoryImage!.toString(),
                                          );
                                          Get.back();
                                        }
                                    );
                                  },
                                  icon: Icon(Icons.delete_outline),
                                ),
                              ),
                              Container(
                                height: 40,
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColor.secondColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${controller.data[index].categoriesName!} / ${controller.data[index].categoriesNameAr!}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                      ),
                    ],
                  )
              );
            }
        ),
      )
    ),
    ),

    );
  }
}
