import 'package:customized_plan/db_plan/db_plan.dart';
import 'package:customized_plan/db_plan/plan_entity.dart';
import 'package:customized_plan/main.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanFirstLogic extends GetxController {
  DBPlan dbPlan = Get.find();

  var maxTargetStr = "".obs;
  List<int> meNeedsList = [];
  List<PlanEntity> planList = [];

  getData() async {
    planList = await dbPlan.getPlanAllData();
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    maxTargetStr.value = greatestGoalList[prefs.getInt('maxTarget') ?? 0];
    meNeedsList = (prefs.getStringList('meNeeds') ?? [])
        .map((e) => int.parse(e))
        .toList();
    await getData();
    update();
    super.onInit();
  }
}
