import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/homescreen_controller.dart';
import 'custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller)=>
       BottomAppBar(
        height: 65,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child:Row(
          children: [
            ...List.generate(
                controller.listPage.length,
                    (index){
                  return
                  Expanded(
                    child: CustomButtonAppBar(
                      onPressed:(){
                        controller.changePage(index);
                      },
                      textButton: controller.bottomappbar[index]["title"],
                      iconData: controller.bottomappbar[index]["icon"],
                      active: controller.currentPage== index? true:false,
                    ),
                  );
                }
            ),
          ],
        ) ,
      ),
    );
  }
}
