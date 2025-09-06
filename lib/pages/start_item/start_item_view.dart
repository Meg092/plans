import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'start_item_logic.dart';

class StartItemView extends GetView<StartItemLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.huel.value
              ? CircularProgressIndicator(color: Colors.redAccent[100])
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.alhfu();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
