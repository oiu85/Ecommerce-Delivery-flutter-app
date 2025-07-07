import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/core/class/handlingdataview.dart';

import '../../controller/reports_controller.dart';
import '../widget/Reports/customreportsnumber.dart';
import '../widget/Reports/mathdetails.dart';
import '../widget/Reports/moredetails.dart';
import '../widget/Reports/sakesdiagram.dart';
import '../widget/Reports/topitemsandusers.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReportsController controller = Get.put(ReportsController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title:  Text("284".tr),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<ReportsController>(
        builder: (controller) =>
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    if( controller.data.isNotEmpty)
                      CustomNumberReports(),
                    const SizedBox(height: 24),
                    SalesDiagram(),
                    const SizedBox(height: 24),
                    TopItemsAndUsers(),
                    const SizedBox(height: 24),
                    MoreDetails(),
                    const SizedBox(height: 24),
                    MathDetails(),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}


