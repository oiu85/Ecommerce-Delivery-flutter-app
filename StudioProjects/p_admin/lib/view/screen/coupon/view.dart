import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:p_admin/core/class/handlingdataview.dart';
import 'package:p_admin/core/constant/routes.dart';

import '../../../controller/coupon/view_controller.dart';

class CouponView extends StatelessWidget {
  const CouponView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CopunController());
    return Scaffold(
        appBar: AppBar(
          title: Text("325".tr),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
             Get.toNamed(AppRoute.couponadd);
          },
          child: Icon(Icons.add_outlined),
        ),
        body: GetBuilder<CopunController>(
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
                                            flex: 3,
                                            child: Card(
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                              child: ListTile(
                                                contentPadding: const EdgeInsets.all(12),
                                                title: Text(
                                                  controller.data[index].couponName ?? '',
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                ),
                                                subtitle: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 6),
                                                    Text("${"326".tr}: ${controller.data[index].couponDiscount}%"),
                                                    Text("${"327".tr}: ${Jiffy.parse(controller.data[index].couponExpierdate!).format(pattern: 'yyyy-MM-dd')}"),
                                                    Text("${"328".tr}: ${controller.data[index].couponCount ?? 'غير معروف'}"),
                                                  ],
                                                ),
                                                trailing: IconButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                      title: "329".tr,
                                                      middleText: "330".tr,
                                                      onCancel: () {},
                                                      onConfirm: () {
                                                        controller.deleteCoupon(controller.data[index].couponId!.toString());
                                                        Get.back();
                                                      },
                                                    );
                                                  },
                                                  icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                                                ),
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
