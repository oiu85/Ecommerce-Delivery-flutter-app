
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class AdminUsersData{
  Crud crud;
  AdminUsersData(this.crud);

  getData()async{
    var response = await crud.postData(AppLink.usersview, {});
    return response.fold((l) => l, (r) => r,);

  }


  unActiveData(String usersid , String usersStatus)async{
    var response = await crud.postData(AppLink.users_unactive, {"id": usersid, "user_status": usersStatus});
    return response.fold((l) => l, (r) => r,);

  }

}