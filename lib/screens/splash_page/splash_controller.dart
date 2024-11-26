import 'dart:math';

import 'package:get/get.dart';

import '../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    myInit();
    super.onInit();
  }

  myInit() async {
    await Future.delayed(const Duration(seconds: 3));
    // bool boolVal=Random().nextBool();  Tells if there is user or not
    Get.offAllNamed(AppRoute.registration);
    if (Random().nextBool()) {}
  }
}
