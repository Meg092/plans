import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'fourth_item_logic.dart';

class FourthItemPage extends GetView<FourthItemLogic> {
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
              'Why is it difficult to persist?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (_, index) {
                  return Obx(() {
                    return Container(
                      height: 82,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: <Widget>[
                        Expanded(
                            child: Text(
                          controller.titles[index],
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff715943)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          controller.selectIndex.value == index
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          size: 20,
                          color: controller.selectIndex.value == index
                              ? primaryColor
                              : Colors.grey,
                        )
                      ].toRow(),
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
                        .marginOnly(bottom: 10)
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
                .gestures(onTap: () async {
              Get.toNamed('/fiveth_item',arguments: controller.planEntity);
            })
          ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
        ).marginAll(15)),
      ),
    );
  }
}
