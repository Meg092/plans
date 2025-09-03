import 'package:customized_plan/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'first_item_logic.dart';

class FirstItemPage extends GetView<FirstItemLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Image.asset(
              'assets/icon0.png',
              fit: BoxFit.cover,
            ),
            const Text(
              'Start customizing your plan',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              child: const Text(
                'Your good study habits enhance your concentration\n\nYour academic performance has improved\n\nYou passed the exam smoothly\n\nYou learn to control your emotion\n\nYour work efficiency has improved\n\nYou can get rid of your\n\nmobile phone addiction and have a good sleep\n\nYou master body management and learn to save money',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff715943)),
              ),
            ).decorated(
                color: const Color(0xfffff8f0),
                border: Border.all(color: const Color(0xffebdfdb)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
            const SizedBox(
              height: 42,
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
            ).decorated(color: primaryColor,borderRadius: BorderRadius.circular(25)).gestures(onTap: (){
              Get.toNamed('/second_item');
            })
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
