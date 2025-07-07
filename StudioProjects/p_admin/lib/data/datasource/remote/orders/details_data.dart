
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersDetailsData{
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(String id)async{
    var response = await crud.postData(AppLink.detailsOrders, {
      "id":id,
    });
    return response.fold((l) => l, (r) => r,);

  }
  rejectOrder(String orderid , String userid, String reason )async{
    var response = await crud.postData(AppLink.rejectOrders, {
      "ordersid":orderid,
      "usersid": userid,
      "note": reason,

    });
    return response.fold((l) => l, (r) => r,);
  }

}