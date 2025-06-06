import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final IconData iconData;
   final bool? active;
   const CustomButtonAppBar({super.key,
    required this.onPressed,
    required this.textButton,
    required this.iconData,
    required this.active
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed:onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData,color: active==true ? AppColor.primaryColor: AppColor.grey2 ,),
          Text(textButton,style: TextStyle(fontSize: 12,color: active==true ? AppColor.primaryColor:AppColor.grey2),),  //for add text under icons
        ],
      ),
    );
  }
}
