import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:p_admin/controller/items/view_controller.dart';
import 'package:p_admin/core/class/handlingdataview.dart';
import 'package:p_admin/core/constant/routes.dart';
import 'package:p_admin/linkapi.dart';

import '../../../core/constant/color.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("225".tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(AppRoute.itemsadd);
        },
        child: Icon(Icons.add_outlined),
      ),
      body: GetBuilder<ItemsController>(
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
                                          imageUrl: "${AppLink.imageItems}/${controller.data[index].itemsImage!}"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text("${controller.data[index].itemsName!}\n ${controller.data[index].itemsNameAr!}"),
                                            subtitle: Text(Jiffy.parse("${controller.data[index].itemsDate}").format(pattern: 'MMMM do yyyy ')),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                  onPressed: (){
                                                   Get.defaultDialog(
                                                     title: "211".tr,
                                                     middleText: "226".tr,
                                                     onCancel: (){},
                                                     onConfirm: (){
                                                       controller.deleteItems(controller.data[index].itemsId!.toString(),
                                                         controller.data[index].itemsImage!.toString(),
                                                       );
                                                       Get.back();
                                                     }
                                                   );
                                                  },
                                                    icon: Icon(Icons.delete_outline),
                                                ),
                                              ],
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
                                                    "${controller.data[index].subcategoryName!} / ${controller.data[index].subcategoryNameAr!}",
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
