import 'package:get/get.dart';

import '../controllers/register_step3_controller.dart';

class RegisterStep3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterStep3Controller>(
      () => RegisterStep3Controller(),
    );
  }
}
