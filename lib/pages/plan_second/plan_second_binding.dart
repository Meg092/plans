import 'package:get/get.dart';

import 'plan_second_logic.dart';

class PlanSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanSecondLogic());
  }
}
