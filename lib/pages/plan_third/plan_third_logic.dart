import 'package:customized_plan/db_plan/db_plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PlanThirdLogic extends GetxController {
  var appVersion = "1.0.0".obs;

  DBPlan dbPlan = Get.find();

  @override
  void onInit() async {
    // TODO: implement onInit
    var info = await PackageInfo.fromPlatform();
    appVersion.value = info.version;
    super.onInit();
  }

  reStart() async {
    Get.dialog(AlertDialog(
      title: const Text(
        'Warm reminder',
        textAlign: TextAlign.center,
      ),
      content: const Text(
        'Do you want to restart?',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.remove('maxTarget');
            await prefs.remove('meNeeds');
            await dbPlan.cleanPlanData();
            await Get.offAllNamed('/first_item');
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }
}
