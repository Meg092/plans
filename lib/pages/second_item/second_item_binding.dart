import 'package:get/get.dart';

import 'second_item_logic.dart';

class SecondItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecondItemLogic());
  }
}
