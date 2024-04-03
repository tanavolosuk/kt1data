import 'package:get/get.dart';
import 'package:kt1data/app/data/services/api_service.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(ApiService()),
    );
  }
}
