import 'package:get/get.dart';

import 'seller_registration_controller.dart';

class SellerRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SellerRegistrationController());
  }
}
