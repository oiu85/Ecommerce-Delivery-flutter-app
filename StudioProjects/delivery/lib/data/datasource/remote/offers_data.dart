
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class OffersData{
  Crud crud;
  OffersData(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r,);

  }

}