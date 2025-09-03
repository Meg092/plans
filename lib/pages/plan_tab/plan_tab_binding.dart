import 'package:customized_plan/pages/plan_first/plan_first_logic.dart';
import 'package:customized_plan/pages/plan_second/plan_second_logic.dart';
import 'package:customized_plan/pages/plan_third/plan_third_logic.dart';
import 'package:get/get.dart';

import 'plan_tab_logic.dart';

class PlanTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanTabLogic());
    Get.lazyPut(() => PlanFirstLogic());
    Get.lazyPut(() => PlanSecondLogic());
    Get.lazyPut(() => PlanThirdLogic());
  }
}
