import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:p_admin/core/class/handlingdataview.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:p_admin/linkapi.dart';

import '../../../controller/categories/view_controller.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: Text("210".tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(AppRoute.categoriesadd);
        },
        child: Icon(Icons.add_outlined),
      ),
      body: GetBuilder<CategoriesController>(
          builder: (controller)=>
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: WillPopScope(
                    onWillPop: (){
                      return controller.myback();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        itemCount: controller.data.length,
                          itemBuilder: (context ,index){
                          return InkWell(
                            onTap: (){
                              controller.goToPageEdit(controller.data[index]);
                            },
                            child: Card(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: CachedNetworkImage(
                                        height: 80,
                                          imageUrl: "${AppLink.imageCategories}/${controller.data[index].categoriesImage!}"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                      child: ListTile(
                                        title: Text("${controller.data[index].categoriesName!}\n ${controller.data[index].categoriesNameAr!}"),
                                        subtitle: Text(Jiffy.parse("${controller.data[index].categoriesDatetime}").format(pattern: 'MMMM do yyyy ')),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              onPressed: (){
                                               Get.defaultDialog(
                                                 title: "211".tr,
                                                 middleText: "212".tr,
                                                 onCancel: (){},
                                                 onConfirm: (){
                                                   controller.deleteCategory(controller.data[index].categoriesId!.toString(),
                                                     controller.data[index].categoriesImage!.toString(),
                                                   );
                                                   Get.back();
                                                 }
                                               );
                                              },
                                                icon: Icon(Icons.delete_outline),
                                            ),

                                          ],
                                        ),
                                      )
                                  ),
                                ],
                              )
                            ),
                          );
                          }
                      ),
                    ),
                  )
              )
      )
    );
  }
}
