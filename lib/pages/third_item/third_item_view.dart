import 'package:customized_plan/db_plan/plan_entity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'third_item_logic.dart';

class ThirdItemPage extends GetView<ThirdItemLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<ThirdItemLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              const Text(
                'Regarding the college entrance examination, I need to do...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 150 / 82),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: meNeedList.length,
                  itemBuilder: (_, index) {
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        meNeedList[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff715943)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                        .decorated(
                            color: controller.meNeedTypes.contains(index)
                                ? const Color(0xfffff0de)
                                : const Color(0xfffffbf8),
                            border: Border.all(
                                color: controller.meNeedTypes.contains(index)
                                    ? const Color(0xffd1b7ae)
                                    : const Color(0xfff8efec)),
                            borderRadius: BorderRadius.circular(24))
                        .gestures(onTap: () {
                      if (controller.meNeedTypes.contains(index)) {
                        controller.meNeedTypes.remove(index);
                      } else {
                        controller.meNeedTypes.add(index);
                      }
                      controller.update();
                    });
                  }),
              const SizedBox(
                height: 80,
              ),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
                  .decorated(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(25))
                  .gestures(onTap: () {
                if (controller.meNeedTypes.isEmpty) {
                  Fluttertoast.showToast(
                      msg: 'Please select at least one item');
                  return;
                }
                Get.toNamed('/fourth_item',
                    arguments: PlanEntity(
                        id: 0,
                        createdTime: DateTime.now(),
                        day: 0,
                        greatestGoal: controller.greatestGoal,
                        meNeeds: controller.meNeedTypes));
              })
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          );
        }).marginAll(15)),
      ),
    );
  }
}
