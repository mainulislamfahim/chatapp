import 'package:get/get.dart';

import '../controllers/onboardscreen_controller.dart';

class OnboardscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardscreenController>(
      () => OnboardscreenController(),
    );
  }
}
