
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class ReportsData{
  Crud crud;
  ReportsData(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.reports, {});
    return response.fold((l) => l, (r) => r,);

  }

}