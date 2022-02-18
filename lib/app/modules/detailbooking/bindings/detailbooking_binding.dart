import 'package:get/get.dart';

import '../controllers/detailbooking_controller.dart';

class DetailbookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailbookingController>(
      () => DetailbookingController(),
    );
  }
}
