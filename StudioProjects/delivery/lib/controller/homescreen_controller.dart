
import 'package:delivery/view/orders/pending.dart';
import 'package:delivery/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../view/orders/accepted.dart';
import '../view/screen/home.dart';

abstract class HomeScreenController extends GetxController{

  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController{
  int currentPage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const Settings(),

  ];

  List bottomappbar=[
    {
      "title":"Pending",
      "icon":Icons.timer_rounded
    },
    {
      "title":"Accepted",
      "icon":Icons.gpp_good
    },
    {
      "title":"Settings",
      "icon":Icons.settings,
    },
  ];
  @override
  changePage(int i) {
    currentPage = i;
    update();

  }

}