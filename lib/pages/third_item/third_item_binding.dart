import 'package:get/get.dart';

import 'third_item_logic.dart';

class ThirdItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThirdItemLogic());
  }
}
