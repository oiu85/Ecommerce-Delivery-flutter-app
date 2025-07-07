

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class MyFavoriteData{
  Crud crud;
  MyFavoriteData(this.crud);
  getData(String id,)async{
    var response = await crud.postData(AppLink.favoriteview, {"id":id.toString()});
    return response.fold((l) => l, (r) => r,);

  }
  deleteData(String id,)async{
    var response = await crud.postData(AppLink.deletefromfavorite, {"id":id.toString()});
    return response.fold((l) => l, (r) => r,);

  }
}