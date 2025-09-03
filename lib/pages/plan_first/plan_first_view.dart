import 'package:customized_plan/main.dart';
import 'package:customized_plan/pages/plan_first/plan_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'plan_first_logic.dart';

class PlanFirstPage extends StatefulWidget {
  const PlanFirstPage({super.key});

  @override
  State<PlanFirstPage> createState() => _PlanFirstPageState();
}

class _PlanFirstPageState extends State<PlanFirstPage>
    with SingleTickerProviderStateMixin {
  PlanFirstLogic controller = Get.find();

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 14, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PlanFirstLogic>(builder: (_) {
        return SafeArea(
            child: <Widget>[
          <Widget>[
            <Widget>[
              Image.asset(
                'assets/icon1.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'My goal',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              )
            ].toRow(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: <Widget>[
                Expanded(
                    child: <Widget>[
                  const Text(
                    'Two weeks (14 days)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff715943)),
                  ),
                  const Text(
                    'Duration',
                    style: TextStyle(color: Color(0xffbfa48c)),
                  ),
                ].toColumn()),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: <Widget>[
                  Obx(() {
                    return Text(
                      controller.maxTargetStr.value,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff715943)),
                      overflow: TextOverflow.ellipsis,
                    );
                  }),
                  const Text(
                    'My goal',
                    style: TextStyle(color: Color(0xffbfa48c)),
                  ),
                ].toColumn())
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            )
                .decorated(
                    color: const Color(0xfffff0de),
                    borderRadius: BorderRadius.circular(23))
                .marginSymmetric(vertical: 25),
          ].toColumn().marginSymmetric(horizontal: 15),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Theme(
                  data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      useMaterial3: true,
                      tabBarTheme: const TabBarThemeData(
                          indicatorColor: Colors.transparent)),
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    controller: _tabController,
                    dividerColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    labelPadding: EdgeInsets.zero,
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor),
                    tabs: List.generate(14, (i) {
                      return Tab(
                        text: "Day ${i + 1}",
                      ).marginSymmetric(horizontal: 20);
                    }),
                  ),
                ),
              ).marginSymmetric(vertical: 10),
              Expanded(
                  child: Container(
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: List.generate(14, (i) {
                    return PlanItem(
                      controller.meNeedsList,
                      i,
                      entity: controller.planList
                          .where((e) => e.day == i)
                          .firstOrNull,
                      onTap: () {
                        controller.getData();
                      },
                    );
                  }),
                ),
              ))
            ].toColumn(),
          ).decorated(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xfff8efec)),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))))
        ].toColumn());
      }),
    );
  }
}
