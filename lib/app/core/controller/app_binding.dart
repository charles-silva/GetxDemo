import 'package:get/get.dart';
import 'package:getdemo/app/core/controller/app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => AppController(), permanent: true);
  }
}
