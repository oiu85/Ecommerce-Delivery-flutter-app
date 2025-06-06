
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class DeilveryData{
  Crud crud;
  DeilveryData(this.crud);
  getData(String id)async{
    var response = await crud.postData(AppLink.dilveryinfo, {"id": id});
    return response.fold((l) => l, (r) => r,);

  }

}