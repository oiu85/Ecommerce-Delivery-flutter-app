

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../view/orders/accepted.dart';
import '../../view/orders/archive.dart';
import '../../view/orders/pending.dart';

abstract class OrderScreenController extends GetxController{

  changePage(int currentPage);
}

class OrderScreenControllerImp extends OrderScreenController{
  int currentPage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView(),
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
      "title":"Archive",
      "icon":Icons.archive_outlined
    },
  ];
  @override
  changePage(int i) {
    currentPage = i;
    update();

  }

}