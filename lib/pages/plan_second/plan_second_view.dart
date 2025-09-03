import 'package:customized_plan/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'plan_second_logic.dart';

class PlanSecondPage extends GetView<PlanSecondLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffbf8),
      body: SafeArea(
          child: <Widget>[
            <Widget>[
              <Widget>[
                Image.asset(
                  'assets/icon2.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Focus',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                )
              ].toRow(),
              const Text(
                'Set time',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff715943)),
              ).gestures(onTap: () {
                controller.showSelectTime(context);
              })
            ]
                .toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
                .marginSymmetric(horizontal: 15),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
                  width: double.infinity,
                  child: <Widget>[
                    Obx(() {
                      return Text(
                        controller.timeStr.value,
                        style: const TextStyle(
                            fontSize: 75,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff715943)),
                      );
                    }),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 227,
                      height: 50,
                      alignment: Alignment.center,
                      child: Obx(() {
                        return Text(
                          controller.isStart.value ? 'Stop focus' : 'Start focus',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        );
                      }),
                    )
                        .decorated(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25))
                        .gestures(onTap: () {
                      if (controller.isStart.value) {
                        controller.stopTimer();
                      } else {
                        controller.startTimer();
                      }
                    })
                  ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
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
