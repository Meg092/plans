import 'package:get/get.dart';

import 'fiveth_item_logic.dart';

class FivethItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FivethItemLogic());
  }
}
