import 'package:customized_plan/pages/plan_first/plan_first_view.dart';
import 'package:customized_plan/pages/plan_second/plan_second_view.dart';
import 'package:customized_plan/pages/plan_third/plan_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import 'plan_tab_logic.dart';

class PlanTabPage extends GetView<PlanTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
         const PlanFirstPage(),
          PlanSecondPage(),
          PlanThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navPlanBars()),
    );
  }

  Widget _navPlanBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.png',fit: BoxFit.cover,width: 22,height: 22,),
          activeIcon:Image.asset('assets/item0Light.png',fit: BoxFit.cover,width: 22,height: 22,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.png',fit: BoxFit.cover,width: 22,height: 22,),
          activeIcon:Image.asset('assets/item1Light.png',fit: BoxFit.cover,width: 22,height: 22,),
          label: 'Focus',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item2Grey.png',fit: BoxFit.cover,width: 22,height: 22,),
          activeIcon:Image.asset('assets/item2Light.png',fit: BoxFit.cover,width: 22,height: 22,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
