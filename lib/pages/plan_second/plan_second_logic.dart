import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';

class PlanSecondLogic extends GetxController {
  int totalSecond = 25 * 60;
  int defaultSecond = 25 * 60;
  var timeStr = "25:00".obs;

  var isStart = false.obs;

  Timer? _timer;

  void startTimer() {
    isStart.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      totalSecond--;
      final minute = totalSecond~/60;
      final second = totalSecond % 60;
      timeStr.value = "${minute < 10 ? "0$minute" : minute}:${second < 10 ? "0$second" : second}";
      if (totalSecond <= 0) {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    isStart.value = false;
    totalSecond = defaultSecond;
    final minute = totalSecond~/60;
    final second = totalSecond % 60;
    timeStr.value = "${minute < 10 ? "0$minute" : minute}:${second < 10 ? "0$second" : second}";
  }

  void showSelectTime(BuildContext context) {
    DatePicker.showDatePicker(context,dateFormat: 'mm:ss',onConfirm: (date,list) {
      stopTimer();
      totalSecond = date.minute * 60 + date.second;
      defaultSecond = totalSecond;
      final minute = date.minute;
      final second = date.second;
      timeStr.value = "${minute < 10 ? "0$minute" : minute}:${second < 10 ? "0$second" : second}";
    });
  }


  @override
  void onClose() {
    // TODO: implement onClose
    stopTimer();
    super.onClose();
  }
}
