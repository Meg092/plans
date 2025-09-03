import 'package:get/get.dart';

import 'plan_first_logic.dart';

class PlanFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanFirstLogic());
  }
}
