import 'package:death_wish_list/home/logic.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
  }
}
