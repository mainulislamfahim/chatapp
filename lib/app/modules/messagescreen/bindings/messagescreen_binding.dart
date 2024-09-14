import 'package:get/get.dart';

import '../controllers/messagescreen_controller.dart';

class MessagescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagescreenController>(
      () => MessagescreenController(),
    );
  }
}
