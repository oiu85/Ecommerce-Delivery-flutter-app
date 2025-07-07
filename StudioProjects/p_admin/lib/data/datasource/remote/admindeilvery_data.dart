
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';


class AdminDeilveryData{
  Crud crud;
  AdminDeilveryData(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.deliveryview, {});
    return response.fold((l) => l, (r) => r,);

  }


  addDeilvery(Map data)async{
    var response = await crud.postData(AppLink.deliveryadd, data);
    return response.fold((l) => l, (r) => r,);
  }

  delete(String deliveryId)async{
      var response = await crud.postData(AppLink.deliverydelete, {"delivery_id" : deliveryId});
      return response.fold((l) => l, (r) => r,);

  }

}