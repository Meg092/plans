import 'package:get/get.dart';

import 'start_item_logic.dart';

class StartItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      StartItemLogic(),
      permanent: true,
    );
  }
}
