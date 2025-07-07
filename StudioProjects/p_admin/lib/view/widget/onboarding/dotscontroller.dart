
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboardingcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CoustomDotControllerOnBoarding extends StatelessWidget {
  const CoustomDotControllerOnBoarding({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                duration: const Duration(milliseconds: 400),
                width: controller.cuurentPage == index ? 25 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: controller.cuurentPage == index 
                      ? AppColor.primaryColor 
                      : AppColor.primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: controller.cuurentPage == index 
                      ? [
                          BoxShadow(
                            color: AppColor.primaryColor.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 1),
                          )
                        ] 
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
