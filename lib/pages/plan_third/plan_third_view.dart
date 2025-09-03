import 'package:customized_plan/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'plan_third_logic.dart';

class PlanThirdPage extends GetView<PlanThirdLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Restart', 'About app'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        index == 0
            ? const Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: Colors.grey,
              )
            : Obx(() {
                return Text(
                  controller.appVersion.value,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                );
              })
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      if (index == 0) {
        controller.reStart();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffbf8),
      body: SafeArea(
          child: <Widget>[
        <Widget>[
          Icon(
            Icons.settings,
            size: 28,
            color: primaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Setting',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: primaryColor),
          )
        ].toRow().marginSymmetric(horizontal: 15),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                padding: const EdgeInsets.all(12),
                child: <Widget>[_item(0, context), _item(1, context)].toColumn(
                    separator: Divider(
                  height: 15,
                  color: Colors.grey.withOpacity(0.3),
                )),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(12))
            ].toColumn(),
          ).marginAll(15),
        ).decorated(
                color: Colors.white,
                border: Border.all(color: const Color(0xfff8efec)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))))
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
    );
  }
}
