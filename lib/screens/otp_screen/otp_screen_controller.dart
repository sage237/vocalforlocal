import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sms_autofill/sms_autofill.dart';

import '../../utils/constants.dart';

class OTPController extends GetxController with CodeAutoFill {
  RxInt index = 0.obs;
  String mobileno = '';
  String email = '';
  RxString text = ''.obs;
  RxBool visible = false.obs;

  RxString source = ''.obs;
  RxMap<String, dynamic> msg =
      <String, dynamic>{}.obs; //main msg response from server
  String appSignature = '';
  @override
  void onInit() {
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      appSignature = signature;
    });
    mobileno = Get.arguments['mobile']; //value oy email or phone
    email = Get.arguments['email']; //email or phone

    msg.value = Get.arguments['msg'];

    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    cancel();
    super.onClose();
  }

  @override
  void codeUpdated() {
    text.value = code!;
    index.value = 3;
  }

  @override
  onReady() {
    startTimer(120, () {
      changeResendButton();
    });
  }

  resendOTP(String val) async {
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Loading',
      content: const PopScope(
        canPop: false,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 10,
            ),
            Text(
              ' Sending OTP, please wait',
              // style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
    try {
      final data = {'action': 'OtpSend', 'Mobileno': mobileno, 'Email': email};

      final response = await http.post(apiUrl, body: data);
      final vall = jsonDecode(response.body);
      log('Data $data ${response.body}');

      if (vall['statuscode'] == '200') {
        msg.value = vall;
        Get.back();
      } else {
        Get.back();
        Get.snackbar(
          'Error',
          '${msg['error']}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      log('Exc $e');

      Get.back();
      Get.snackbar('Error', 'Something went wrong!!, please try again later',
          colorText: Colors.white,
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      // Get.back();
      resendButton(false);
      visible(false);
      startTimer(120, () {
        changeResendButton();
      });
    }
  }

  void checkOTP() async {
    // Get.
    // List <Bind<Object>> bindings = Get.findBindings();
    // int numberOfDependencies = bindings.length;
    log('OTP given $text $msg');
    if (text.value.length != 4) {
      Get.dialog(AlertDialog(
        title: const Text(
          'Error',
          style: TextStyle(color: Colors.red),
        ),
        content: const Text('Please Enter Valid And Correct OTP'),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'))
        ],
      ));
      return;
    }
    if (text == msg['code']) {
      Get.back(result: true);
    } else {
      Get.dialog(AlertDialog(
        title: const Text(
          'Error',
          style: TextStyle(color: Colors.red),
        ),
        content: const Text('OTP entered was incorrect'),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'))
        ],
      ));
    }
  }

  //bsfbhsdgfshzgcfzxfgzbsvd

  ///Button Press Command
  onKeyboardTap(String value) {
    text.value = replaceCharAtIndex(text.value, index.value, value);

    if (index < 3) index++;
  }

  String replaceCharAtIndex(String originalString, int index, String newChar) {
    if (index < 0 || index >= originalString.length && text.value.length < 4) {
      return originalString + newChar;
    }

    String prefix = originalString.substring(0, index);
    String suffix = originalString.substring(index + 1);

    return '$prefix$newChar$suffix';
  }

  removeCharAtIndex() {
    if (text.value.isEmpty) return;
    // log('Index $index $text');

    if (index.value < 0 || index.value > text.value.length) {
      // log('This index.value < 0 || index.value > text.value.length');
      throw ArgumentError("Index out of range");
    }
    if (index.value == text.value.length) {
      // log('Tis index.value == text.value.length');
      String prefix = text.value.substring(0, index.value - 1);
      String suffix = text.value.substring(index.value);

      text.value = '$prefix$suffix';
      if (index > 0) index--;
    } else {
      // log('Elase');
      String prefix = text.value.substring(0, index.value);
      String suffix = text.value.substring(index.value + 1);

      text.value = '$prefix$suffix';
      // if (index > 0) index--;
    }
  }

//Timer Controller
  RxBool resendButton = false.obs;
  changeResendButton() {
    resendButton(true);
    // startTimer(30, onTimerEnd)
  }

  final RxInt _timeRemaining = 0.obs;
  Timer? _timer;

  RxInt get timeRemaining => _timeRemaining;

  void startTimer(int initialTime, Function onTimerEnd) {
    _timeRemaining.value = initialTime;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining.value > 0) {
        _timeRemaining.value--;
      } else {
        _timer?.cancel();
        onTimerEnd();
      }
    });
  }
}
