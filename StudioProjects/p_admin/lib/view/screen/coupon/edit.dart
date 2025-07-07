
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_admin/core/class/handlingdataview.dart';
import 'package:p_admin/core/constant/color.dart';
import 'package:p_admin/core/functions/validinput.dart';
import 'package:p_admin/core/shared/customtextformglobal.dart';
import 'package:p_admin/view/widget/auth/custombuttomauth.dart';
import '../../../controller/coupon/edit_controller.dart';


class CouponEdit extends StatelessWidget {
  const CouponEdit({super.key});

  @override
  Widget build(BuildContext context) {
    CouponEditController controller = Get.put(CouponEditController());
    return Scaffold(
        appBar: AppBar(
          title: Text("331".tr),
        ),
        body: GetBuilder<CouponEditController>(
            builder: (controller)=> HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      Text("${"340".tr}: " ,
                        style: TextStyle(
                            fontSize: 20 ,
                            fontWeight: FontWeight.bold ,
                            color: AppColor.primaryColor),
                      ),
                      SizedBox(height: 30,),
                      CustomTextFormGlobal(
                        hintText: "332".tr,
                        labelText: "333".tr,
                        iconDate: Icons.discount_outlined,
                        mycontroller: controller.name,
                        valid: (val){
                          return validInput(val!, 1, 60, "");
                        },
                        isNumber: false,
                      ),

                      CustomTextFormGlobal(
                        hintText: "334".tr,
                        labelText: "335".tr,
                        iconDate: Icons.format_list_numbered_rtl,
                        mycontroller: controller.count,
                        valid: (val){
                          return validInput(val!, 1, 60, "");
                        },
                        isNumber: true,
                      ),

                      CustomTextFormGlobal(
                        hintText: "336".tr,
                        labelText: "337".tr,
                        iconDate: Icons.format_list_numbered_rtl,
                        mycontroller: controller.discount,
                        valid: (val){
                          return validInput(val!, 1, 60, "");
                        },
                        isNumber: true,
                      ),

                      CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.single,
                          calendarViewMode: CalendarDatePicker2Mode.day,
                          firstDate: DateTime.now(),
                          selectedDayHighlightColor: AppColor.primaryColor,
                          todayTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                          dayTextStyle: TextStyle(
                            color: Colors.black,
                          ),
                          selectedDayTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                          weekdayLabelTextStyle: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          dynamicCalendarRows: true,
                          dayBorderRadius: BorderRadius.circular(8),
                          daySplashColor: Colors.grey.withOpacity(0.2),
                          animateToDisplayedMonthDate: true,
                          lastMonthIcon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColor.primaryColor),
                          nextMonthIcon: Icon(Icons.arrow_forward_ios_rounded, color: AppColor.primaryColor),
                          disableVibration: true,
                        ),
                        value: controller.dates,
                        onValueChanged: (dates) => controller.dates = dates,
                      ),
                      CustomButtomAuth(
                        text: "339".tr ,
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
