import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.0.obs;
  final opc = 1.0.obs;
  final tmpdataindicator = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    count.value = 0.0;
  }

  void scrollListener(ScrollNotification scrollInfo) {
    try {
      if (scrollInfo.metrics.pixels == 0) {
        opc.value = 1.0;
      }
      if (scrollInfo.metrics.pixels < 50) {
        count.value = scrollInfo.metrics.pixels;

        if (scrollInfo.metrics.pixels > tmpdataindicator.value) {
          if (opc.value > 0.1) {
            opc.value = opc.value - 0.2;
          }
          tmpdataindicator.value = scrollInfo.metrics.pixels;
        } else {
          if (opc.value < 1.0) {
            opc.value = opc.value + 0.2;
          }

          tmpdataindicator.value = scrollInfo.metrics.pixels;
        }
      } else {
        opc.value = 0.0;
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  void increment() => count.value++;
}
