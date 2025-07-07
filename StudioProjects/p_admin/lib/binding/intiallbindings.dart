
import 'package:get/get.dart';

import '../core/class/crud.dart';

class IntiallBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}