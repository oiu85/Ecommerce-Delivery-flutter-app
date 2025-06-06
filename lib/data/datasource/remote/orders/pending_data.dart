

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersPendingData{
  Crud crud;
  OrdersPendingData(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.viewPendingOrders,{});
    return response.fold((l) => l, (r) => r,);

  }

  approveData(String deliveryid, String usersid , String ordersid)async{
    var response = await crud.postData(AppLink.approveOrders,
        { "deliveryid":deliveryid , "usersid":usersid , "ordersid": ordersid });
    return response.fold((l) => l, (r) => r,);

  }




















}