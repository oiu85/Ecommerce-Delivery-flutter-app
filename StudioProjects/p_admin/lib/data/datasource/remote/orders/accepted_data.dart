

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersAcceptedData{
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.viewAcceptedOrders, {});
    return response.fold((l) => l, (r) => r,);

  }


  donePrepare(String ordersid , String usersid , String orderstype)async{
    var response = await crud.postData(AppLink.prepare, {"ordersid":ordersid, "usersid":usersid , "orderstype":orderstype });
    return response.fold((l) => l, (r) => r,);

  }




















}