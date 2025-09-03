import 'package:customized_plan/db_plan/db_plan.dart';
import 'package:customized_plan/pages/first_item/first_item_binding.dart';
import 'package:customized_plan/pages/first_item/first_item_view.dart';
import 'package:customized_plan/pages/fiveth_item/fiveth_item_binding.dart';
import 'package:customized_plan/pages/fiveth_item/fiveth_item_view.dart';
import 'package:customized_plan/pages/fourth_item/fourth_item_binding.dart';
import 'package:customized_plan/pages/fourth_item/fourth_item_view.dart';
import 'package:customized_plan/pages/plan_first/plan_first_binding.dart';
import 'package:customized_plan/pages/plan_first/plan_first_view.dart';
import 'package:customized_plan/pages/plan_second/plan_second_binding.dart';
import 'package:customized_plan/pages/plan_second/plan_second_view.dart';
import 'package:customized_plan/pages/plan_tab/plan_tab_binding.dart';
import 'package:customized_plan/pages/plan_tab/plan_tab_view.dart';
import 'package:customized_plan/pages/plan_third/plan_third_binding.dart';
import 'package:customized_plan/pages/plan_third/plan_third_view.dart';
import 'package:customized_plan/pages/second_item/second_item_binding.dart';
import 'package:customized_plan/pages/second_item/second_item_view.dart';
import 'package:customized_plan/pages/third_item/third_item_binding.dart';
import 'package:customized_plan/pages/third_item/third_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color primaryColor = const Color(0xfffc947b);
Color bgColor = Colors.white;

List<String> greatestGoalList = [
  "College entrance examination",
  "Self-discipline in life",
  "Improving grades",
  "postgraduate entrance examination and civil service examination",
  "Qualification certificates",
  "others"
];

List<String> meNeedList = [
  "Record mistakes",
  "Read",
  "Memorize words",
  "Keep previewing",
  "practice calligraphy",
  "Do homework on time"
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync(() => DBPlan().init());
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final info = prefs.getInt('maxTarget');
  bool isMain = false;
  if (info != null) {
    isMain = true;
  }
  runApp(MyApp(
    isMain: isMain,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({this.isMain = false, super.key});

  final bool? isMain;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Plans,
      initialRoute: isMain ==  true ? '/plan_tab' : '/first_item',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: bgColor,
          colorScheme: ColorScheme.light(
            primary: primaryColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: primaryColor,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.white,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          )),
    );
  }
}
List<GetPage<dynamic>> Plans = [
  GetPage(name: '/first_item', page: () => FirstItemPage(),binding: FirstItemBinding(),),
  GetPage(name: '/second_item', page: () => SecondItemPage(),binding: SecondItemBinding(),),
  GetPage(name: '/third_item', page: () => ThirdItemPage(),binding: ThirdItemBinding(),),
  GetPage(name: '/fourth_item', page: () => FourthItemPage(), binding: FourthItemBinding()),
  GetPage(name: '/fiveth_item', page: () => FivethItemPage(),binding: FivethItemBinding(),),
  GetPage(name: '/plan_tab', page: () => PlanTabPage(),binding: PlanTabBinding(),),
  GetPage(name: '/plan_first', page: () => const PlanFirstPage(),binding: PlanFirstBinding(),),
  GetPage(name: '/plan_second', page: () => PlanSecondPage(),binding: PlanSecondBinding(),),
  GetPage(name: '/plan_third', page: () => PlanThirdPage(),binding: PlanThirdBinding(),),
];