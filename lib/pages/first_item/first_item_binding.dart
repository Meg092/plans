import 'package:get/get.dart';

import 'first_item_logic.dart';

class FirstItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstItemLogic());
  }
}
