import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../routes/routes.dart';
import '../../utils/new_date_picker.dart' as dp;
import '../../utils/screen_util.dart';

class RegistrationController extends GetxController {
  PageController pageController = PageController();
  final form1 = GlobalKey<FormState>();

  final mobileController = TextEditingController();
  final emailController = TextEditingController();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final birthdayController = TextEditingController();
  final anniversaryController = TextEditingController();

  void sendOTP() async {
    Get.toNamed(AppRoute.home);
    // if (form1.currentState!.validate()) {
    //   log('object');
    //   var response = await Get.toNamed(AppRoute.otpPage, arguments: {
    //         'mobile': mobileController.text,
    //         'email': emailController.text,
    //         'msg': {"statuscode": "200", "OTP": "4587"}
    //       }) ??
    //       false;
    //
    //   if (response) {
    //     pageController.nextPage(
    //         duration: const Duration(milliseconds: 500), curve: Curves.linear);
    //   }
    //
    //   log('OTP resp $response');
    // }
  }

  //OTP vars here

  RxBool resendButton = false.obs;

  void sendName() async {
    if (form1.currentState!.validate()) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  var datepicked = Rxn();
  pickDate(TextEditingController controller) async {
    Get.dialog(CupertinoAlertDialog(
      content: SizedBox(
        height: Responsive.safeBlockVerticalWAB * 25,
        width: Responsive.safeBlockHorizontal * 90,
        child: dp.CupertinoDatePicker(
          mode: dp.CupertinoDatePickerMode.date,
          //backgroundColor: Colors.blue,
          dateOrder: DatePickerDateOrder.dmy,
          onDateTimeChanged: (value) {
            datepicked.value = DateFormat("dd-MMM").format(value);
          },
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              if (datepicked.value != null) {
                controller.text = datepicked.value;
              } else {
                controller.text = DateFormat("dd-MMM").format(DateTime.now());
              }
              datepicked.value = null;
              Get.back();
            },
            child: const Text("Ok")),
      ],
    ));
  }

  void sendDates() {}
}
