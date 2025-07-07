import 'package:get/get.dart';
import 'package:p_admin/data/datasource/remote/settings_data.dart';
import 'package:p_admin/data/model/settingsmodel.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class SettingsControllerAdmin extends GetxController {
  SettingsData settingsData = SettingsData(Get.find());

  List<SettingsModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await settingsData.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.clear();
        data.addAll(
            datalist.map((e) => SettingsModel.fromJson(e)).toList());
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  Future<void> editData({required String title, required String body}) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await settingsData.editData({
      "title": title,
      "body": body,
    });

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.back(); // رجوع للواجهة الرئيسية
        getData();  // تحديث البيانات
      } else {
        Get.snackbar("Error", "Failed to update settings");
      }
    }

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
