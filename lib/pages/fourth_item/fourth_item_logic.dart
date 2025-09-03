import 'package:customized_plan/db_plan/plan_entity.dart';
import 'package:get/get.dart';

class FourthItemLogic extends GetxController {

  PlanEntity planEntity = Get.arguments;

  var selectIndex = 0.obs;

  final titles = ["No plan", "Three-minute enthusiasm", "Lack of a sense of achievement"];

}
