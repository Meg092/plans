import 'package:get/get.dart';

import 'plan_third_logic.dart';

class PlanThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanThirdLogic());
  }
}
