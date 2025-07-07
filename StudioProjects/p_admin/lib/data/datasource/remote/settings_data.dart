
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class SettingsData{
  Crud crud;
  SettingsData(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.settingsview, {});
    return response.fold((l) => l, (r) => r,);

  }

  editData(Map data)async{
    var response = await crud.postData(AppLink.settingsedit, data);
    return response.fold((l) => l, (r) => r,);

  }

}