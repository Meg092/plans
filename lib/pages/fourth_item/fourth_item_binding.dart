import 'package:get/get.dart';

import 'fourth_item_logic.dart';

class FourthItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FourthItemLogic());
  }
}
