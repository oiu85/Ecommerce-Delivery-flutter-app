

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersAcceptedData{
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData(String deliveryid)async{
    var response = await crud.postData(AppLink.viewAcceptedOrders, {"id":deliveryid,});
    return response.fold((l) => l, (r) => r,);

  }


  doneDeliveryData(String ordersid , String usersid )async{
    var response = await crud.postData(AppLink.doneOrders, {"ordersid":ordersid, "usersid":usersid });
    return response.fold((l) => l, (r) => r,);

  }




















}