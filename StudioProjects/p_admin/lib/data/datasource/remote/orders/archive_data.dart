
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersArchiveData{
  Crud crud;
  OrdersArchiveData(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.viewArchiveOrders, {});
    return response.fold((l) => l, (r) => r,);

  }

  getUsers()async{
    var response = await crud.postData(AppLink.usersview, {});
    return response.fold((l) => l, (r) => r,);

  }


}