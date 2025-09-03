import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'second_item_logic.dart';

class SecondItemPage extends GetView<SecondItemLogic> {
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
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            const Text(
              'My greatest goal',
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
                itemCount: greatestGoalList.length,
                itemBuilder: (_, index) {
                  return Obx(() {
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        greatestGoalList[index],
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
                            color: controller.selectIndex.value == index
                                ? const Color(0xfffff0de)
                                : const Color(0xfffffbf8),
                            border: Border.all(
                                color: controller.selectIndex.value == index
                                    ? const Color(0xffd1b7ae)
                                    : const Color(0xfff8efec)),
                            borderRadius: BorderRadius.circular(24))
                        .gestures(onTap: () {
                      controller.selectIndex.value = index;
                    });
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
              Get.toNamed('/third_item',arguments: controller.selectIndex.value);
            })
          ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
        ).marginAll(15)),
      ),
    );
  }
}
